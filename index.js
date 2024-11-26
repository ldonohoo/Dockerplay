//example 1 simple non-dependency server

// const http = require("http");

// http
//   .createServer(function (request, response) {
//     console.log("request received");
//     response.end("omg hi", "utf-8");
//   })
//   .listen(3000);
// console.log("server started");

//example 2 fastify server (like express) with a dependency
// this is the sample app from fastify.dev

// Require the framework and instantiate it
const fastify = require("fastify")({ logger: true });

// Declare a route
fastify.get("/", function handler(request, reply) {
  reply.send({ hello: "world" });
});

// Run the server!

// you can't do it this way as it will auto point to local host
// fastify.listen({ port: 8080 })
fastify.listen({ port: 8080, host: "0.0.0.0" }, (err) => {
  if (err) {
    fastify.log.error(err);
    process.exit(1);
  }
});