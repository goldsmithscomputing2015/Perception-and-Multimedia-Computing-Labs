class HSBcolour {
  float h, s, b;

  // Empty constructor because it seems like a good idea
  HSBcolour() {};

  // Allow users to set hsb values directly
  HSBcolour(float _h, float _s, float _b) {
    this.h = _h;
    this.s = _s;
    this.b = _b;
  }

  // Allow users to set value by standard colour
  HSBcolour(color c) {
    this.convert(red(c),green(c),blue(c));
  }

  // Allow users to set value by object of class RGBcolour
  HSBcolour(RGBcolour c) {
    this.convert(c.r,c.g,c.b);
  }

  // Perform calculation
  convert(float r, float g, float b) {
    float max = max(r, g, b);
    float min = min(r, g, b);

    if (max == r) {
      this.h = ( ( PI / 3 ) * ( ( g - b ) / ( max - min ) ) ) % ( 2 * PI );
    }
    else if (max == g) {
      this.h = ( 2*PI / 3 + PI / 3 ) * ( (b - r ) / ( max - min ) );
    }
    else if (max == b) {
      this.h = ( 4*PI / 3 + PI / 3 ) * ( ( r - g ) / ( max - min ) );
    }
    else {
      this.h = 0;
    }

    if (Float.isNaN(this.h)) {
      this.h = 0;
    }

    if (max == 0) {
      this.s = 0;
    }

    else {
      this.s = 1 - min / max;
    }

    this.b = max;
  }
}

class RGBcolour {
  float r, g, b;

  // Empty constructor because it seems like a good idea
  RGBcolour() {};

  // Allow users to set rgb properties directly
  RGBcolour(float _r, float _g, float _b){
    this.r = _r;
    this.g = _g;
    this.b = _b;
  }

  // Allow users to instantiate based on an object of type HSBcolour
  RGBcolour(HSBcolour c){
    this.convert(c.h,c.s,c,b);
  }

  // Perform calculation
  convert(float h, float s, float b) {
    float f, p, q, t;
    int i;

    b = 255*b;
    
    i = floor(3*h/PI);
    f = (3*h/PI) - i;
    p = b*(1-s);
    q = b*(1-f*s);
    t = b*(1-(1-f)*s);

    switch(i) {
      case 0:
        this.r = b;
        this.g = t;
        this.b = p;
        break;
      case 1:
        this.r = q;
        this.g = b;
        this.b = p;
        break;
      case 2:
        this.r = p;
        this.g = b;
        this.b = t;
        break;
      case 3:
        this.r = p;
        this.g = q;
        this.b = b;
        break;
      case 4:
        this.r = t;
        this.g = p;
        this.b = b;
        break;
      case 5:
        this.r = b;
        this.g = p;
        this.b = q;
        break;
      default:
        println("ERROR");
        break;
    }
    this.r = ceil(this.r);
    this.g = ceil(this.g);
    this.b = ceil(this.b);
  }
}

color col;
color col2;
HSBcolour c;
RGBcolour c2;
float h, s, b;

void setup() {

  // @todo: best write some code to test this

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

