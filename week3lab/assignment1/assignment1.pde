PImage redyellow;
PImage bluered;
PImage redgreen;
PImage bluegreen;

color r;
color g;
color b;
color y;

void setup(){
	hint(ENABLE_RETINA_PIXELS);
	size(200,400, "processing.core.PGraphicsRetina2D");
	rectMode(CORNER);
	redyellow = createImage(100,100,RGB);
	bluered = createImage(100,100,RGB);
	redgreen = createImage(100,100,RGB);
	bluegreen = createImage(100,100,RGB);
	redyellow.loadPixels();
	bluered.loadPixels();
	redgreen.loadPixels();
	bluegreen.loadPixels();
	r = color(255,0,0);
	g = color(0,255,0);
	b = color(0,0,255);
	y = color(255,255,0);
	for(int n = 0; n < redyellow.pixels.length; n++){
		if((n+floor(n/100))%2 == 0){
			redyellow.pixels[n] = r;
			bluered.pixels[n] = b;
			redgreen.pixels[n] = r;
			bluegreen.pixels[n] = b;
		}
		else{
			redyellow.pixels[n] = y;
			bluered.pixels[n] = r;
			redgreen.pixels[n] = g;
			bluegreen.pixels[n] = g;
		}
	}
	redyellow.updatePixels();
}

void draw(){
	image(redyellow,0,0);
	image(bluered,0,100);
	image(redgreen,0,200);
	image(bluegreen,0,300);
	noStroke();
	fill(color(255,148,0));
	rect(100,0,100,100);
	fill(color(147,0,147));
	rect(100,100,100,100);
	fill(color(147,147,0));
	rect(100,200,100,100);
	fill(color(0,153,153));
	rect(100,300,100,100);
}