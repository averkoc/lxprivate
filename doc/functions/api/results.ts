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
  timestamp: string;
  hostname?: string;
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
    if (!payload.student_account || !payload.workshop_id) {
      return new Response(
        JSON.stringify({
          error: 'Bad Request',
          message: 'Missing required fields: student_account and workshop_id'
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

    // Generate unique ID
    const id = generateId();

    // Get client IP address
    const ipAddress = context.request.headers.get('CF-Connecting-IP') || 'unknown';

    // Store results in D1 database
    await context.env.DB.prepare(
      `INSERT INTO results 
       (id, student_account, workshop_id, workshop_title, total_checks, 
        passed_checks, results_json, timestamp, ip_address, hostname)
       VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`
    )
      .bind(
        id,
        payload.student_account,
        payload.workshop_id,
        payload.workshop_title || null,
        payload.total_checks,
        payload.passed_checks,
        JSON.stringify(payload.results),
        payload.timestamp || new Date().toISOString(),
        ipAddress,
        payload.hostname || null
      )
      .run();

    // Return success response
    return new Response(
      JSON.stringify({
        success: true,
        id: id,
        message: 'Results submitted successfully'
      }),
      {
        status: 201,
        headers: {
          'Content-Type': 'application/json',
          'Location': `/api/results/${id}`
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
