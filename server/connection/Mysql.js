const mysql = require('mysql')
const query =  mysql.createConnection({
user:'root',
password:'root1234',
database:'ivocapp',
host:'localhost',
waitForConnections: true,
Promise: global.Promise,
})


query.connect((err) => {
    if (err) {
      console.error('Error connecting to MySQL database:', err);
      return;
    }
    console.log('Connected to MySQL database!');

  });

  module.exports = query;