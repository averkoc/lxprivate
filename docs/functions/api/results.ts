// POST /api/results - Submit test results
// This endpoint receives test results from lxcheck clients

interface Env {
  DB: D1Database;
}

interface ResultItem {
  name: string;
  type: string;
  passed: boolean;
  message: string;
}

interface ResultPayload {
  student_account: string;
  workshop_id: string;
  workshop_title?: string;
  group_code: string;
  timestamp: string;
  hostname?: string;
  machine_id?: string;
  total_checks: number;
  passed_checks: number;
  results: ResultItem[];
}

// Generate a unique ID for the result
function generateId(): string {
  return `${Date.now()}-${Math.random().toString(36).substr(2, 9)}`;
}

export async function onRequestPost(context: {
  request: Request;
  env: Env;
}): Promise<Response> {
  try {
    // Parse the JSON payload
    const payload: ResultPayload = await context.request.json();

    // Validate required fields
    if (!payload.student_account || !payload.workshop_id || !payload.group_code) {
      return new Response(
        JSON.stringify({
          error: 'Bad Request',
          message: 'Missing required fields: student_account, workshop_id, and group_code'
        }),
        {
          status: 400,
          headers: { 'Content-Type': 'application/json' }
        }
      );
    }

    if (!Array.isArray(payload.results)) {
      return new Response(
        JSON.stringify({
          error: 'Bad Request',
          message: 'results must be an array'
        }),
        {
          status: 400,
          headers: { 'Content-Type': 'application/json' }
        }
      );
    }

    // Get machine ID from payload, fallback to hostname or IP
    const machineId = payload.machine_id || payload.hostname || context.request.headers.get('CF-Connecting-IP') || 'unknown';

    // Store results in D1 database using INSERT ON CONFLICT
    // This ensures only one record per student per workshop per group
    // Updates passed_checks only if new score is better or equal
    await context.env.DB.prepare(
      `INSERT INTO results 
       (student_account, workshop_id, group_code, workshop_title, passed_checks, total_checks,
        results_json, timestamp, attempt_count, machine_id, hostname)
       VALUES (?, ?, ?, ?, ?, ?, ?, ?, 1, ?, ?)
       ON CONFLICT (student_account, workshop_id, group_code) DO UPDATE SET
         passed_checks = CASE
           WHEN EXCLUDED.passed_checks >= results.passed_checks THEN EXCLUDED.passed_checks
           ELSE results.passed_checks
         END,
         timestamp = EXCLUDED.timestamp,
         attempt_count = results.attempt_count + 1,
         results_json = CASE
           WHEN EXCLUDED.passed_checks >= results.passed_checks THEN EXCLUDED.results_json
           ELSE results.results_json
         END,
         workshop_title = EXCLUDED.workshop_title,
         total_checks = EXCLUDED.total_checks,
         machine_id = EXCLUDED.machine_id,
         hostname = EXCLUDED.hostname`
    )
      .bind(
        payload.student_account,
        payload.workshop_id,
        payload.group_code,
        payload.workshop_title || null,
        payload.passed_checks,
        payload.total_checks,
        JSON.stringify(payload.results),
        payload.timestamp || new Date().toISOString(),
        machineId,
        payload.hostname || null
      )
      .run();

    // Return success response
    return new Response(
      JSON.stringify({
        success: true,
        message: 'Results submitted successfully'
      }),
      {
        status: 201,
        headers: {
          'Content-Type': 'application/json'
        }
      }
    );

  } catch (error) {
    console.error('Error processing results:', error);
    
    return new Response(
      JSON.stringify({
        error: 'Internal Server Error',
        message: 'Failed to process results'
      }),
      {
        status: 500,
        headers: { 'Content-Type': 'application/json' }
      }
    );
  }
}

// GET /api/results - List results with optional filters
export async function onRequestGet(context: {
  request: Request;
  env: Env;
}): Promise<Response> {
  try {
    const url = new URL(context.request.url);
    const student = url.searchParams.get('student');
    const workshop = url.searchParams.get('workshop');
    const group = url.searchParams.get('group');
    const limit = parseInt(url.searchParams.get('limit') || '50');
    const offset = parseInt(url.searchParams.get('offset') || '0');

    let query = 'SELECT * FROM results WHERE 1=1';
    const params: any[] = [];

    if (student) {
      query += ' AND student_account = ?';
      params.push(student);
    }

    if (workshop) {
      query += ' AND workshop_id = ?';
      params.push(workshop);
    }

    if (group) {
      query += ' AND group_code = ?';
      params.push(group);
    }

    query += ' ORDER BY timestamp DESC LIMIT ? OFFSET ?';
    params.push(limit, offset);

    const stmt = context.env.DB.prepare(query).bind(...params);
    const { results } = await stmt.all();

    // Parse results_json back to objects
    const formattedResults = results?.map((row: any) => ({
      ...row,
      results: JSON.parse(row.results_json)
    })) || [];

    return new Response(
      JSON.stringify({
        results: formattedResults,
        count: formattedResults.length,
        limit,
        offset
      }),
      {
        status: 200,
        headers: { 'Content-Type': 'application/json' }
      }
    );

  } catch (error) {
    console.error('Error fetching results:', error);
    
    return new Response(
      JSON.stringify({
        error: 'Internal Server Error',
        message: 'Failed to fetch results'
      }),
      {
        status: 500,
        headers: { 'Content-Type': 'application/json' }
      }
    );
  }
}
