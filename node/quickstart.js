///////////////////////////
/// NODE.JS QUICKSTART ///
//////////////////////////////////////////////////////////////////////////////
/// SOURCE: https://nodejs.org/en/
/// node.js is a JavaScript runtime built on Chrome's V8 JavaScript engine. 
/// Node.js uses an event-driven, non-blocking I/O model that makes it 
/// lightweight and efficient. Node.js' package ecosystem, npm, is the largest
/// ecosystem of open source libraries in the world.
//////////////////////////////////////////////////////////////////////////////
/// Once you have installed Node, let's try building our first web server. 
/// Create a file named "app.js", and paste the following code:           
/////////////////////////////////////////////////////////////////////////////
const http = require('http');

const hostname = '127.0.0.1';
const port = 3000;

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  res.end('Hello World\n');
});

server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
});

//////////////////////////////////////////////////////////////////////////////
/// After that, run your web server using node app.js, visit               
/// http://localhost:3000, and you will see a message 'Hello World'        
//////////////////////////////////////////////////////////////////////////////
