int n = 50; //number of circles
float angle;
int i = 0;

void setup() {
  size(700,700);
  frameRate(10);
}

void draw() {
  translate(width/2, height/2);
  background(255);
  fill(0);
  //ellipse(0,0,5,5);
  
  angle = TWO_PI/n;
  
  for (int j = 0; j <= n; j++) {
    ellipse(100*sin(j*angle), 100*cos(j*angle), 10, 10);
  }
  
  fill(255);
  noStroke();
  if (i < n) {
    ellipse(100*sin(i*angle), 100*cos(i*angle), 12, 12);
    i++;
  }
  else if (i == n) {
    i = 0;
  }
  
  

}

void keyPressed() {
  if (key == '+') {
    n++;
  }
  else if (key == '-') {
    n--;
  }
}
