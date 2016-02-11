display <- hardware.uart12;
display.configure(2400, 8, PARITY_NONE, 1, NO_CTSRTS);
display.write(0x0C);
display.write("Munich Maker Lab      Connecting...");

agent.on("text", function(content) {
    //display.write(0x0C);
    display.write(content);
});

agent.on("handshake_pong", function(content) {
    display.write(0x0C);
    display.write("Munich Maker Lab      Connected");
});

agent.send("handshake_ping", "");
