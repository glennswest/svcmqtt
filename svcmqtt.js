var mdns = require('mdns-js');

servers = [];

var ad = mdns.createAdvertisement(mdns.tcp('mqtt'), 1883);
ad.start();


// Start up server
function restart_server(data){

        if (!data){
           console.log("Starting Mosquitto");
          } else {
           console.log("Mosquitto - " + data + "Restarting");
          }
        child = execFile('/usr/sbin/mosquitto -v -c /etc/mosquitto/mosquitto.conf',[], {cwd: "/etc/mosquitto"}, (error, stdout, stderr) => {
                if (error){
                   console.log(stderr);
                   console.log("Error On Exec: " + util.inspect(error) + "");
                   }
                console.log(stdout);
                //restart_server("Restarting Mosquitto");
                });
        console.log("Server PID= " + util.inspect(child.pid) + "");
        child.stderr.on('data',function(data){
            console.log(data.toString());
            });
        child.stdout.on('data',function(data){
            console.log(data.toString());
            });
        server_pid = child.pid;
}

restart_server();



// watch all mqtt servers 
var browser = mdns.createBrowser(mdns.tcp('mqtt'));
browser.on('serviceUp', function(service) {
  server = {};
  console.log("service up: ", service);
});
browser.on('serviceDown', function(service) {
  console.log("service down: ", service);
});

browser.start();

