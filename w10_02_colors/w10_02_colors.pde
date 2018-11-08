// code 1 FA 18
// bryan ma

// color variable practice

// this sketch creates a single color variable, loads a color into it
// with the color() function, and then uses it to draw the background.

// change the color variable to an array of color variables. add as many
// as you like. then in the draw loop, set the background to some color
// in the array. this might look like: 

// background(c[whichColor]);

// use either conditional logic or a modulo operator to have which color 
// is being used by background() change periodically. see the example gif.

color whichR[] = new int[255];
int c;

void setup() {
  for (int i = 0; i < whichR.length; i++) {
    c = whichR[i];
  }
}

void draw() {
  background(c);
  if (frameCount % 60 == 0) {
    c += 60;
  }
}
