// code 1 FA 18
// bryan ma

// generative portrait 1

// this sketch, as well as w10_05_portrait2, uses the basic approach we used
// in class to create a generative representation of an image loaded into memory.
// use one of these two sketches as the starting point to create your own 
// generative graphic "portrait". try using red(), green(), blue(), saturation(), 
// hue(), and brightness() to get values to represent in your drawing.

// bonus - apply a class inspired by w10_03_paintbrush to your approach.
// instead of drawing a simple ellipse or other shape, create an instance 
// of the brushstroke class at every sourced point that you get() the color on.

// in the case of w10_05_portrait2, they would all need to be loaded into 
// an arraylist and drawn all together, as well as modified in order to have 
// a particle-like lifetime, or something similar.

PImage img;

void setup() {
  size(785, 785);
  img = loadImage("doggo.jpg");
  background(0);
  noStroke();
}

void draw() {
  rectMode(CENTER);
  for (int x = 0; x < img.width; x+=6) {
    for (int y = 0; y < img.height; y+=6) {
      color got = img.get(x, y);
      fill(red(got));
      float size = map(brightness(got), 0, 255, 0, 6);
      ellipse(x, y, size, size);
    }
  }
}
