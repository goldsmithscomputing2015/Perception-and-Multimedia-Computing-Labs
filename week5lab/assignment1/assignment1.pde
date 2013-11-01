int radius = 50;
int pointCount = 6;
int n = 0;

void setup(){
    size(200,200);
    strokeWeight(10);
    frameRate(10);
}

void draw(){
  background(#FFFFFF);
  translate(width/2, height/2);
  for(int x = 0; x < pointCount - 1; x ++){
    point(cos(n*TWO_PI/pointCount)*radius,sin(n*TWO_PI/pointCount)*radius);
    n =(n + 1) % pointCount;
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP && pointCount < 10) {
      pointCount++;
    }
    else if (keyCode == DOWN && pointCount > 0) {
      pointCount--;
    } 
  }
}