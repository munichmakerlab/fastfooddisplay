function chr(code) {
    return format("%c", code);
}

local replace_in = [ chr(0xA2), "Ö", "Ü", "ä", "ö", "ü"];
local replace_out = [ chr(0xA2), chr(0xA3), chr(0xA4), chr(0xA5), chr(0xA6), chr(0xA7) ];

function requestHandler(request, response) {
    try {
        if ("text" in request.query) {
            local text = request.query.text
            device.send("text", text);
        }
        // send a response back saying everything was OK.
        response.send(200, "OK");
    } catch (ex) {
        response.send(500, "Internal Server Error: " + ex);
    }
}
 
// register the HTTP handler
http.onrequest(requestHandler);

device.on("handshake_ping", function(content) {
    device.send("handshake_pong", "");
});h

