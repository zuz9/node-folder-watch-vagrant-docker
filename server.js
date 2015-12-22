var http = require('http');

function handleRequest(request, response){
    response.end('It Works!! Path Hit: ' + request.url);
}

var server = http.createServer(handleRequest);

//Lets start our server
server.listen(3000, function(){
    console.log("Server listening on: http://localhost:%s", 3000);
});