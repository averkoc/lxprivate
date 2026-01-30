// API Authentication Middleware for Cloudflare Pages Functions
// This middleware protects /api/* routes with Bearer token authentication

interface Env {
  LXCHECK_API_TOKEN: string;
}

export async function onRequest(context: {
  request: Request;
  env: Env;
  next: () => Promise<Response>;
}): Promise<Response> {
  const url = new URL(context.request.url);

  // Only protect /api/* routes
  if (url.pathname.startsWith('/api/')) {
    const authHeader = context.request.headers.get('Authorization');
    const expectedToken = `Bearer ${context.env.LXCHECK_API_TOKEN}`;

    if (!authHeader || authHeader !== expectedToken) {
      return new Response(
        JSON.stringify({ 
          error: 'Unauthorized',
          message: 'Invalid or missing authentication token'
        }), 
        {
          status: 401,
          headers: {
            'Content-Type': 'application/json',
            'WWW-Authenticate': 'Bearer realm="lxcheck"'
          }
        }
      );
    }

    // Optional: Rate limiting check could go here
    // For example, check against a KV store to limit requests per IP
  }

  // For dashboard routes (not /api/*), authentication is handled by
  // Cloudflare Access/Pages authentication configured in the dashboard

  return context.next();
}
