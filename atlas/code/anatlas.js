inlets = 1;
outlets = 2;

var bx = 16;
var by = 8;

var leds = new Array(128);
var ledBuffer = new Array(64);
var atlasNow = new Array(64);
var atlasNext = new Array(64);
var steps = new Array(64);
for(i=0;i<128;i++) { leds[i] = 0; }
for(i=0;i<64;i++) { ledBuffer[i] = 0; steps[i] = 0; atlasNow[i] = 0; }


var currentStep = 0;
var currentDir = 0;
var frame = new Task(atlasThis, this);
frame.interval = 10; // 5fps redraw
frame.repeat();

function anything() {
	args = arrayfromargs(messagename, arguments);

	if(args[0] = "/atlas/grid/key") {
		// grid key input
		if(args[1]<8) { // left quad
			if(args[3]==1) { steps[args[1]+8*args[2]] = 1-steps[args[1]+8*args[2]]; refresh(); }
		}
		else { // right quad
			if(args[3]==1) { // if a press
				//currentDir = 1-currentDir; refresh();
				xn =+ Math.pow((args[1]-10)/4,3);
				yn =+ Math.pow((args[2]-2)/4,3)-0.2;
				post(xn,yn,"\n");
			}
		}

		//if(args[3]==1) atlasNow[args[1]+(bx*args[2])] = 15; // fully activate cell at press location
	}

	else if(args[0] = "/sys/size") { bx = args[1]; by = args[2]; } // attached grid size
}

function refresh() {
	for(i=0;i<128;i++) leds[i] = 0; // clear the display
	for(i=0;i<8;i++) { // draw the current playback head
		if(currentDir == 0) leds[currentStep + bx*i] = 0;
		else leds[i + bx*currentStep] = 0;
	}
	for(x=0;x<8;x++) // 
		for(y=0;y<8;y++) { 
			leds[x+bx*y] = Math.max(leds[x+bx*y], (steps[x+8*y]*15));
			leds[x+8+bx*y] = Math.ceil(atlasNow[x+8*y]); // need to take Math.floor as atlasNow holds float levels
		}

	drawLeds();	
}

var xo = 0;
var yo = 0;
var xn = 0;
var yn = 0; // temporary values for calculation

function atlasThis() { // timed function
	currentStep = (currentStep+1)%8;
	refresh();

	for(i=0;i<64;i++) atlasNow[i] = Math.max(atlasNow[i]-0.2,0); // fade out by 0.2 (of 15) each frame
	xo = xn;
	yo = yn;

	xn = 1 - yo + Math.abs(xo); // x(n+1) = 1 - y(n) + |x(n)|
	yn = xo; // y(n+1) = x(n)

	// led map is each cell worth 0.5 & start from -1
	// each point needs to be drawn in 4 cells to allow AA
	var xnp = Math.floor((xn+1)*2);
	var ynp = Math.floor((yn+1)*2);
	
	var x0 = 1-(((xn+1)*2)-xnp);
	var x1 = ((xn+1)*2)-xnp;
	var y0 = 1-(((yn+1)*2)-ynp);
	var y1 = ((yn+1)*2)-ynp;

	atlasNow[xnp+8*ynp] = Math.min((x0*y0*15) + atlasNow[xnp+8*ynp], 15);
	atlasNow[1+xnp+8*ynp] = Math.min((x1*y0*15) + atlasNow[1+xnp+8*ynp], 15);
	atlasNow[8+xnp+8*ynp] = Math.min((x0*y1*15) + atlasNow[8+xnp+8*ynp], 15);
	atlasNow[9+xnp+8*ynp] = Math.min((x1*y1*15) + atlasNow[9+xnp+8*ynp], 15);

	//atlasNow = atlasNext; // dump new atlas into the current array
	outlet(1,xn,yn);
}

function drawLeds() {
	if(by==8 && bx==8) outlet(0,0,0,leds); // 8x8
    else if(by==8 && bx==16) { // 16x8
        for(i=0;i<8;i++)
            for(j=0;j<8;j++) ledBuffer[i*8+j] = leds[i*16+j];
        outlet(0,0,0,ledBuffer);

        for(i=0;i<8;i++)
            for(j=0;j<8;j++) ledBuffer[i*8+j] = leds[i*16+j+8];
        outlet(0,8,0,ledBuffer);
    }
    else if(by==16 && bx==8) { // 8x16
        for(i=0;i<8;i++)
            for(j=0;j<8;j++) ledBuffer[i*8+j] = leds[i*8+j];
        outlet(0,0,0,ledBuffer);

        for(i=0;i<8;i++)
            for(j=0;j<8;j++) ledBuffer[i*8+j] = leds[i*8+j+64];
        outlet(0,0,8,ledBuffer);
    }
    else if(by==16 && bx==16) { // 16x16
        for(i=0;i<8;i++)
            for(j=0;j<8;j++) ledBuffer[i*8+j] = leds[i*16+j];
        outlet(0,0,0,ledBuffer);

        for(i=0;i<8;i++)
            for(j=0;j<8;j++) ledBuffer[i*8+j] = leds[i*16+j+128];
        outlet(0,0,8,ledBuffer);

        for(i=0;i<8;i++)
            for(j=0;j<8;j++) ledBuffer[i*8+j] = leds[i*16+j+8];
        outlet(0,8,0,ledBuffer);

        for(i=0;i<8;i++)
            for(j=0;j<8;j++) ledBuffer[i*8+j] = leds[i*16+j+136];
        outlet(0,8,8,ledBuffer);
    }
}