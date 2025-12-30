export async function onRequest(context) {
  const { request, next } = context;
  const authHeader = request.headers.get('Authorization');

  // Change these to your desired login info
  const USERNAME = "myuser";
  const PASSWORD = "mypassword";

  if (authHeader) {
    const [scheme, encoded] = authHeader.split(' ');
    if (scheme === 'Basic') {
      const decoded = atob(encoded);
      const [user, pass] = decoded.split(':');

      if (user === USERNAME && pass === PASSWORD) {
        return await next(); // Credentials match! Show the site.
      }
    }
  }

  // If no auth or wrong auth, trigger the browser's login popup
  return new Response('Unauthorized', {
    status: 401,
    headers: {
      'WWW-Authenticate': 'Basic realm="Secure Area"',
    },
  });
}
