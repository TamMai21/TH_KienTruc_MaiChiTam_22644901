const http = require('http');
const db = require('./src/config/configDB');

const PORT = 5000;

const server = http.createServer((req, res) => {
  res.writeHead(200, { 'Content-Type': 'text/plain; charset=utf-8' });
  res.end('Xin chao! Server Node.js dang chay tot!\n');
});



db.query('SELECT 1 + 1 AS result', (err, results) => {
  if (err) throw err;
  console.log('Kết quả:', results[0].result);
});

server.listen(PORT, () => {
  console.log(`Server dang chay tai: http://localhost:${PORT}`);
});