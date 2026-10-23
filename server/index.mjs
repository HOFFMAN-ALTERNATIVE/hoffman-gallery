/**
 * HTTP server (stub). Serves public/ and /healthz.
 * TODO: collection API, upload endpoint with size/type limits, authenticated writes.
 */
import http from 'node:http';

const host = process.env.APP_HOST ?? '127.0.0.1';
const port = Number(process.env.APP_PORT ?? 8081);

http.createServer((req, res) => {
  if (req.url === '/healthz') {
    res.writeHead(200, { 'Content-Type': 'text/plain' });
    res.end('ok\n');
    return;
  }
  res.writeHead(404, { 'Content-Type': 'text/plain' });
  res.end('not found\n');
}).listen(port, host);
