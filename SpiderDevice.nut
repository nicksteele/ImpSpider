
imp.configure("Spider Control", [], []);
cmd <- "nada";

//Assign controls
led <- hardware.pin1;
fwd <- hardware.pin9;
bck <- hardware.pin8;
lft <- hardware.pin7;
rgt <- hardware.pin5;
//abctrl <- hardware.pin2; //Don't use in current config! This is/was to control A/B channel, still wonky
 
// configure led to be a digital output
led.configure(DIGITAL_OUT);
fwd.configure(DIGITAL_OUT);
bck.configure(DIGITAL_OUT);
lft.configure(DIGITAL_OUT);
rgt.configure(DIGITAL_OUT);
//abctrl.configure(DIGITAL_OUT);
 
// create a global variable to store current
// state of the LED
state <- 0;
altstate <- 0;
 
function forward() {
  fwd.write(0);
  bck.write(1);
  lft.write(1);
  rgt.write(1);
}

function backward() {
  fwd.write(1);
  bck.write(0);
  lft.write(1);
  rgt.write(1);
}

function stop() {
  fwd.write(1);
  bck.write(1);
  lft.write(1);
  rgt.write(1);
}

function left() {
  fwd.write(1);
  bck.write(1);
  lft.write(0);
  rgt.write(1);
}
function right() {
  fwd.write(1);
  bck.write(1);
  lft.write(1);
  rgt.write(0);
}
function blink() {
  // invert the value of state:
  // when state = 1, 1-1 = 0
  // when state = 0, 1-0 = 1
  altstate = state;
  state = 1-state;
  // write current state to led pin
  stop();
}
function setSpider(cmd){
    //console.log ("doing it");
    if(cmd == "stop"){
        stop();
    } else if (cmd == "lft") {
        stop();
        left();
    } else if (cmd == "rgt") {
        stop();
        right();
    } else if (cmd == "fwd") {
        stop();
        forward();
    } else if (cmd == "bck") {
        stop();
        backward();
    } else {
        stop();
    }
}
// start the loop
agent.on("cmd", setSpider);
blink();
