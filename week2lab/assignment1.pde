float w, 
h, 
offset, 
r = 200;
void setup() {
  size(500, 500);

  w = width;
  h= height;
}

void draw() {
  background(255);
  noFill();
  stroke(0);
  strokeWeight(1);
  ellipse(w/2, w/2, r, r);
  fill(0);
  for (int i = 0; i < 4; i++) {
    fill(0);
    stroke(0);
    strokeWeight(1);
    arc(w/2, h/2, r, r, offset + i*HALF_PI, offset + i*HALF_PI +QUARTER_PI);
    noFill();
    stroke(0);
    strokeWeight(4);
    arc(w/2, h/2, 0.75*r, 0.75*r, offset +i*HALF_PI + QUARTER_PI, offset +(i+0.75)*HALF_PI);
    arc(w/2, h/2, 0.25*r, 0.25*r, offset + (i+0.75)*HALF_PI, offset +(i+0.75)*HALF_PI + 0.5*QUARTER_PI);
  }
  
  text("Press ' f ' to turn the circle CW, or ' g ' to turn the circle CCW",20,30);
  
  if (keyPressed && key=='f') {
    offset+=QUARTER_PI/5;
  }
  else if (keyPressed && key=='g') {
    offset-=QUARTER_PI/5;
  }
  
}

