const cluster = require('cluster');
const os = require('os');
const express = require('express');
const cors = require('cors');
const app = express();
const user = require('./routes/UserRoute');
const post = require('./routes/PostRoutes');
const comment = require('./routes/CommentPost');
const db = require('./connection/Mysql');

const numCPUs = os.cpus().length;

if (cluster.isMaster) {
  console.log(`Master ${process.pid} is running`);

  // Fork workers
  for (let i = 0; i < numCPUs; i++) {
    cluster.fork();
  }

  cluster.on('exit', (worker, code, signal) => {
    console.log(`worker ${worker.process.pid} died`);
    cluster.fork();
  });
} else {
  console.log(`Worker ${process.pid} started`);

  // Enable CORS for all routes
  app.use(cors());

  // Parse incoming request bodies as JSON
  app.use(express.json());

  // Define your routes
  app.use('/user', user);
  app.use('/post', post);
  app.use('/comment', comment);

  // Start the server
  app.listen(3000, () => {
    console.log(`Worker ${process.pid} listening on port 3000`);
  });
}
