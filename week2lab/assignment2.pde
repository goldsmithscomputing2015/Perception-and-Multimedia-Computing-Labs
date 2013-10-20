int w=500, 
h=250;

String [] numbers = new String[3];
String [][] numbers2 = new String[5][5];
color [] colors = new color[4];
color [][] colors2 = new color[5][5];

void setup() {
  size(w, h);
  numbers[0] = "ONE";
  numbers[1] = "TWO";
  numbers[2] = "THREE";
  colors[0] = color(255, 0, 0);
  colors[1] = color(0, 255, 0);
  colors[2] = color(0, 0, 255);
  colors[3] = color(0, 0, 0);
  randomize();
}

void draw() {
  background(255);
  textSize(20);
  for (int i=0; i<5; i++) {
    for (int j=0; j<5; j++) {
      rect(i*100, j*50, 100, 50);
      fill(colors2[i][j]);
      text(numbers2[i][j], i*100+20, j*50+30);
      noFill();
    }
  }
}

void randomize() {
  for (int i=0; i< numbers2.length; i++) {
    for (int j=0; j<numbers2.length; j++) {
      numbers2[i][j] = numbers[(int)random(0, 3)];
      colors2[i][j] = colors[(int)random(0,4)];
    }
  }
}

