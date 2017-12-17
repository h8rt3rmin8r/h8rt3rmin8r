var ws;
var socketurl;
if (location.protocol === 'https:') {
    socketurl = "wss://" + "socket.etherscan.io" + "/wshandler";
} else {
    socketurl = "ws://" + "socket.etherscan.io" + "/wshandler";
}

$().ready(function () {

    //disable the certain buttons until a successfull connection is made
    $("#btnDisconnect").prop("disabled", true);
    $("#textSelect").prop("disabled", true);
    $("#btnSend").prop("disabled", true);

    $("#btnConnect").click(function () {
        $("#spanStatus").text("connecting");
        // A ping is REQUIRED every 20secs to keep websocket alive
        ws = new WebSocket(socketurl);

        ws.onopen = function () {
            $("#spanStatus").text("Connected to " + socketurl + "");
            var ping = pinger(ws);
            //disable connect button
            $("#btnConnect").prop("disabled", true);
            //renable back the the other buttons
            $("#btnDisconnect").prop("disabled", false);
            $("#textSelect").prop("disabled", false);
            $("#btnSend").prop("disabled", false);
        };
        ws.onmessage = function (evt) {
            //we can parse the result into a json
            //var obj = jQuery.parseJSON(evt.data);                                                           
            //if (obj.event == 'pong') {
            //    console.log("received: " + evt.data);
            //}
            var d = new Date();
            $('#discussion').append('<li><pre>' + d.toLocaleTimeString() + ' : ' + evt.data + '</pre></li>');
        };
        ws.onerror = function (evt) {
            $("#spanStatus").text(evt.message);
            $('#discussion').append('<li><pre>Error! ' + evt.message + '</pre></li>');
        };
        ws.onclose = function () {
            var d = new Date();
            $("#spanStatus").text("DISCONNECTED from server");
            $('#discussion').append('<li><pre>' + d.toLocaleTimeString() + ' : Disconnected from server</pre></li>');
            //disable certain buttons upon disconnect
            $("#btnConnect").prop("disabled", false);
            $("#btnDisconnect").prop("disabled", true);
            $("#textSelect").prop("disabled", true);
            $("#btnSend").prop("disabled", true);
        };
    });
    $("#btnSend").click(function () {
        if (ws.readyState == WebSocket.OPEN) {
            ws.send($("#textSelect").val());
        } else {
            $("#spanStatus").text("Connection is closed");
        }
    });
    $("#btnDisconnect").click(function () {
        ws.close();
    });
});


function pinger(ws) {
    var timer = setInterval(function () {
        if (ws.readyState == 1) {
            ws.send(JSON.stringify({
                event: "ping"
            }));
            //console.log(JSON.stringify({ event: "ping" }));
        }
    }, 20000);
    return {
        stop: function () {
            clearInterval(timer);
        }
    };
}
