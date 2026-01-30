// GET /api/init-db - Initialize database table (one-time setup)
interface Env {
  DB: D1Database;
}

export async function onRequestGet(context: {
  request: Request;
  env: Env;
}): Promise<Response> {
  try {
    // Create table
    await context.env.DB.exec(`
      CREATE TABLE IF NOT EXISTS results (
        id TEXT PRIMARY KEY,
        student_account TEXT NOT NULL,
        workshop_id TEXT NOT NULL,
        workshop_title TEXT,
        total_checks INTEGER NOT NULL,
        passed_checks INTEGER NOT NULL,
        results_json TEXT NOT NULL,
        timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
        ip_address TEXT,
        hostname TEXT
      );
    `);

    // Create indexes
    await context.env.DB.batch([
      context.env.DB.prepare(`CREATE INDEX IF NOT EXISTS idx_student ON results(student_account)`),
      context.env.DB.prepare(`CREATE INDEX IF NOT EXISTS idx_workshop ON results(workshop_id)`),
      context.env.DB.prepare(`CREATE INDEX IF NOT EXISTS idx_timestamp ON results(timestamp DESC)`),
      context.env.DB.prepare(`CREATE INDEX IF NOT EXISTS idx_student_workshop ON results(student_account, workshop_id)`)
    ]);

    return new Response(
      JSON.stringify({
        success: true,
        message: 'Database initialized successfully'
      }),
      {
        status: 200,
        headers: { 'Content-Type': 'application/json' }
      }
    );

  } catch (error) {
    console.error('Error initializing database:', error);
    
    return new Response(
      JSON.stringify({
        error: 'Internal Server Error',
        message: error instanceof Error ? error.message : 'Failed to initialize database'
      }),
      {
        status: 500,
        headers: { 'Content-Type': 'application/json' }
      }
    );
  }
}
