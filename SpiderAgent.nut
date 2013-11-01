server.log("Turn Spider Left: " + http.agenturl() + "?cmd=lft");
server.log("Turn Spider Right: " + http.agenturl() + "?cmd=rgt");
server.log("Send Spider Backwards: " + http.agenturl() + "?cmd=bck");
server.log("Send Spider Forwards: " + http.agenturl() + "?cmd=fwd");
server.log("Stop Spider: " + http.agenturl() + "?cmd=stop");

 
function requestHandler(request, response) {
  try {
    // check if the user sent cmd as a query parameter
    if ("cmd" in request.query) {
      if (request.query.cmd == "lft" || request.query.cmd == "rgt" || request.query.cmd == "fwd" || request.query.cmd == "bck" || request.query.cmd == "stop" ) {
        local spiderCmd = request.query.cmd;
        // Send Command
        device.send("cmd", spiderCmd); 
      }
    }
    // send a "No Content" response back
    response.send(204, "OK");
  } catch (ex) {
    //response.send(500, "Internal Server Error: " + ex);
  }
}
// register the HTTP handler
http.onrequest(requestHandler);
