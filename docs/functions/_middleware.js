export async function onRequest(context) {
  const { request, next } = context;
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
