class HSBcolour {
  float h, s, b;
  HSBcolour() {
  };
  HSBcolour(color c) {
    float max = max(red(c), green(c), blue(c));
    float min = min(red(c), green(c), blue(c));

    if (max == red(c)) {
      h = ( ( PI / 3 ) * ( ( green(c) - blue(c) ) / ( max - min ) ) ) % ( 2 * PI );
    }
    else if (max == green(c)) {
      h = ( 2*PI / 3 + PI / 3 ) * ( ( blue( c ) - red( c ) ) / ( max - min ) );
    }
    else if (max == blue(c)) {
      h = ( 4*PI / 3 + PI / 3 ) * ( ( red( c ) - green( c ) ) / ( max - min ) );
    }
    else {
      h = 0;
    }

    if (Float.isNaN(h)) {
      h = 0;
    }

    if (max == 0) {
      s = 0;
    }

    else {
      s = 1 - min / max;
    }

    b = max;
  }
  HSBcolour(float _h, float _s, float _b) {
    h = _h;
    s = _s;
    b = _b;
  }
}

class RGBcolour {

  float h, s, b;
  int i;
  float f, p, q, t;
  float red, green, blue;

  RGBcolour(float _h, float _s, float _b) {
    h = _h;
    s = _s;
    b = 255*_b;
    calculate();
  }

  void calculate() {
    i = floor(3*h/PI);
    f = (3*h/PI) - i;
    p = b*(1-s);
    q = b*(1-f*s);
    t = b*(1-(1-f)*s);
  }

  int redValue() {
    switch(i) {
    case 0:
      red = b;
      break;
    case 1:
      red = q;
      break;
    case 2:
      red = p;
      break;
    case 3:
      red = p;
      break;
    case 4:
      red = t;
      break;
    case 5:
      red = b;
      break;
    default:
      println("ERROR");
      break;
    }
    return ceil(red);
  }

  int greenValue() {
    switch(i) {
    case 0:
      green = t;
      break;
    case 1:
      green = b;
      break;
    case 2:
      green = b;
      break;
    case 3:
      green = q;
      break;
    case 4:
      green = p;
      break;
    case 5:
      green = p;
      break;
    default:
      println("ERROR");
      break;
    }
    return ceil(green);
  }

  int blueValue() {
    switch(i) {
    case 0:
      blue = p;
      break;
    case 1:
      blue = p;
      break;
    case 2:
      blue = t;
      break;
    case 3:
      blue = b;
      break;
    case 4:
      blue = b;
      break;
    case 5:
      blue = q;
      break;
    default:
      println("ERROR");
      break;
    }
    return ceil(blue);
  }
}

color col;
color col2;
HSBcolour c;
RGBcolour c2;
float h, s, b;

void setup() {
  size(400, 200);
  colorMode(RGB);
  h = PI/4;
  s = 0.9;
  b = 0.5;  // hue, saturation and brightness values to be converted to RGB. It is not in a color variable because we are in an RGB colorspace.
  col = color(67, 150, 67); // color to be converted to HSB
  c2 = new RGBcolour(h, s, b); 
  c = new HSBcolour(col);
  col2 = color(c2.redValue(), c2.greenValue(), c2.blueValue()); //Resulting color from HSB-RGB conversion.
  //  println("hue: " + c.h);
  //  println("sat: " + c.s);
  //  println("bri: " + c.b);
  //  println("Red: " + c2.redValue());
  //  println("Green: " + c2.greenValue());
  //  println("Blue; " + c2.blueValue());
}

void draw() {
  noStroke();
  textSize(10);
  fill(col);
  rect(0, 0, width/2, height);
  fill(255);
  text("Source (RGB): " + red(col) +", "+ green(col) + ", " + blue(col), 0, height-30);
  text("Result (HSB): " + c.h +", "+c.s+ ", " + c.b, 0, height-10);
  fill(col2);
  rect(width/2, 0, width, height);
  fill(255);
  text("Source (HSB): " + h +", "+ s + ", " + b, width/2, height-30);
  text("Result (RGB): " + red(col2) +", "+green(col2)+ ", " + blue(col2), width/2, height-10);
}

