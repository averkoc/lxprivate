// Merged middleware: API Bearer token + Basic Auth for site
// Merged middleware: API Bearer token + Basic Auth for site
export async function onRequest(context) {
  const { request, next, env } = context;
  const url = new URL(request.url);

  // API routes (/api/*): Use Bearer token authentication
  if (url.pathname.startsWith('/api/')) {
    const authHeader = request.headers.get('Authorization');
    const expectedToken = `Bearer ${env.LXCHECK_API_TOKEN}`;

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
    // API authenticated, continue
    return await next();
  }

  // All other routes: Use Basic Auth (username/password)
  const authHeader = request.headers.get('Authorization');

  // YOUR CREDENTIALS
  const VALID_USER = "centriasakari";
  const VALID_PASS = "olikosemahdoton100";

  if (authHeader && authHeader.startsWith('Basic ')) {
    // Extract the base64 part
    const base64 = authHeader.split(' ')[1];
    
    try {
      // Decode using a more robust method
      const decoded = atob(base64);
      const [user, pass] = decoded.split(':');

      if (user === VALID_USER && pass === VALID_PASS) {
        return await next();
      }
    } catch (e) {
      // If decoding fails, it will fall through to the 401 response
    }
  }

  return new Response('Authentication Required', {
    status: 401,
    headers: {
      'WWW-Authenticate': 'Basic realm="Secure Area"',
    },
  });
}
