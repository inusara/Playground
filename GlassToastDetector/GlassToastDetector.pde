import processing.sound.*;
AudioIn[] inputs = new AudioIn[2];
Amplitude rms;
FFT fft; //Fast Fourier Transform

int scale = 1;
int bands = 512;
float[] spectrum = new float[bands];

void setup() {
  size(640, 360);
  background(0);
  
  // creates then start an Audio input
  // grabbing the 1st channel  
  for(int i = 0; i < inputs.length; i++) {
    inputs[i] = new AudioIn(this, 0);  
    inputs[i].start(); 
  }
  
  rms = new Amplitude(this);
  // this patches the input into the volume analyzer
  rms.input(inputs[0]);
  
  fft = new FFT(this);
  // calculates the FFT of a signal and returns
  // the positive normalized magnitude spectrum
  fft.input(inputs[1], bands);
}

void draw() {
  background(0);
  
  /*-----------------
    draws the volume analyzer visualisation
    -----------------*/
  // rms.analyze() return a value between 0 and 1
  // for ellipse use, scaling and mapping will be from 0 to 0.5
  scale = int(map(rms.analyze(), 0, 0.5, 1, 350));
  noStroke();
  fill(0, 255, 255);
  ellipse(width/2, height/2, 1*scale, 1*scale);
  
  /*-----------------
    draws the spectrum visualisation
    -----------------*/  
  fft.analyze(spectrum);
  stroke(0, 255, 0);
  
  // this will center the spectrum visualisation
  // since bands max value can only be 512
  translate(((width/2) - (bands/2)), -10);
  
  for(int i = 0; i < bands; i++) {
    // The result of the FFT is normalized
    // draw the line for frequency band i
    // scaling it up by 5 to get more amplitude
    line( i, height, i, height - spectrum[i]*height*5 );
  }
}
