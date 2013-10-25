class HSBcolour{
	float h, s, b;
	HSBcolour(){};
	HSBcolour(color c){
		float max = max(red(c),green(c),blue(c));
		float min = min(red(c),green(c),blue(c));

		if(max == red(c)) {
			h = ( ( PI / 3 ) * ( ( green(c) - blue(c) ) / ( max - min ) ) ) % ( 2 * PI );
		}
		else if(max == green(c)) {
			h = ( 2*PI / 3 + PI / 3 ) * ( ( blue( c ) - red( c ) ) / ( max - min ) );
		}
		else if(max == blue(c)) {
			h = ( 4*PI / 3 + PI / 3 ) * ( ( red( c ) - green( c ) ) / ( max - min ) );
		}
		else{
			h = 0;
		}

		if(Float.isNaN(h)){
			h = 0;
		}

		if(max == 0){
			s = 0;
		}

		else{
			s = 1 - min / max;
		}

		b = max;
	}
	HSBcolour(float _h, float _s, float _b){
		h = _h;
		s = _s;
		b = _b;
	}
}

void setup(){
	size(200,200);
	colorMode(RGB);
	HSBcolour c = new HSBcolour(color(67,67,67));
	println("hue: " + c.h);
	println("sat: " + c.s);
	println("bri: " + c.b);
}

void draw(){

}
