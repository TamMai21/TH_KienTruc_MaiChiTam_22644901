const mysql = require('mysql2');

const connection = mysql.createConnection({
  host: process.env.DB_HOST || 'mysql',       // tên service trong docker-compose
  port: process.env.DB_PORT || 3306,
  user: process.env.DB_USER || 'user',
  password: process.env.DB_PASSWORD || 'password',
  database: process.env.DB_NAME || 'mydb',
});

connection.connect((err) => {
  if (err) {
    console.error('Kết nối MySQL thất bại:', err.message);
    return;
  }
  console.log('Kết nối MySQL thành công!');
});

module.exports = connection;