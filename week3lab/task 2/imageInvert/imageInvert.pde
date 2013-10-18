PImage img;
int mode;

void setup() {
 size(1024,768);
 colorMode(HSB, 100);
 img = loadImage("image.jpg"); 
}

void draw() {
  image(img,0,0);
  switch(mode) {
    case 1: filter(INVERT);
    break;
    case 0: filter(GRAY);
    break;
  }
  fill(0);
  ellipse(width/2,height/2,10,10);
  
}

void keyPressed() {
  if (key == 'i') {
    mode = 1;
  }
  if (key == 'g') {
    mode = 0;
  }
}
