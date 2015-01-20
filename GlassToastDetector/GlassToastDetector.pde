import processing.sound.*;
AudioIn input;
Amplitude rms;
int scale = 1;

void setup() {
  size(640, 360);
  background(0);
  
  // creates then start an Audio input
  // grabbing the 1st channel
  input = new AudioIn(this, 0);
  input.start();
  
  // creates a new Amplitude analyzer
  rms = new Amplitude(this);
  // this patches the input into the volume analyzer
  rms.input(input);
}

void draw() {
  background(0);

  // rms.analyze() return a value between 0 and 1
  // for ellipse use, scaling and mapping will be from 0 to 0.5
  scale = int(map(rms.analyze(), 0, 0.5, 1, 350));
  noStroke();
  
  fill(255, 0, 0);
  // draws the input visualisation
  ellipse(width/2, height/2, 1*scale, 1*scale);
}
