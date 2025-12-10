import http from 'http';
import os from 'os';
import prom from 'prom-client';

prom.collectDefaultMetrics();

const chirpCount = new prom.Counter({
  name: 'num_chirps',
  help: 'How many chirps?',
});

const server = http.createServer(async (req, res) => {
  

  const ip = req.socket.remoteAddress;
  let ret;

  if(req.url == '/metrics') {
    res.writeHead(200, {'Content-Type': 'text/plain'});
    ret = await prom.register.metrics();
  } else {
    res.writeHead(200, {'Content-Type': 'application/json'});
    chirpCount.inc();
    ret = JSON.stringify({
      c: 'chirp!',
      h: os.hostname(),
      i: ip,
      r: req.url,
      p: process.pid,
    });
  }

  res.end(ret);
  console.log(req.headers, req.url, ret);
});

const port = process.env.PORT || '8080';
server.listen(port, () => {
  console.log(`Listening on port ${port}...`);
});