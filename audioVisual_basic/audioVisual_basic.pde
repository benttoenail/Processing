//for DOC go to http://code.compartmental.net/minim/
//some really cool shit
//also check out how to generate sound as opposed to ust listening to it
//maybe you should try using functions instead of classes...

import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim; // minim main class
AudioPlayer song; // song/file class
AudioPlayer kick;
AudioPlayer arpeggio;
AudioInput input; // input class
FFT fft; // frequency class

arpeggioShape arShape;

float xb;
float kickBeat;
float arp;


void setup() {
  size(512, 700);
  smooth();
  noStroke();
  

    arShape = new arpeggioShape(width/2, height/2-100);
    


  minim = new Minim(this);
  song = minim.loadFile("SnackTime_01.mp3", 512); // make the buffer size same width
  kick = minim.loadFile("SnackTime_kick.mp3", 512);
  arpeggio = minim.loadFile("SnackTime_arppegieos_02.mp3");
  input = minim.getLineIn();
  fft = new FFT(song.bufferSize(), song.sampleRate());

  //song.play();
  kick.play();
  arpeggio.play();
}

void draw() {
  //fading bkg
  fill(255, 25);
  rectMode(CORNER);
  rect(0, 0, width, height);
  noFill();

  //generating images based on freq channels
  fft.forward(song.mix);

  for (int i =0; i < fft.specSize ()*2; i++) {
    line(i, height, i, height - fft.getBand(i)*4);
  }

  //creating a waveform with input data
  for (int i =0; i < song.bufferSize () -1; i++) {
    line(i, 50 +song.left.get(i)*50, i+1, 50 + song.left.get(i+1)*50);
    line(i, 50 +song.right.get(i)*50, i+1, 50 + song.right.get(i+1)*50);
  }

  //basic sound input to drive shape
  xb = song.left.get(1)*1000;
  kickBeat = kick.left.get(1)*1000;
  print(xb+"\n");
  ellipse(width/2, height/2-200, xb, xb);
  fill(0);
  ellipse(width/2, height/2+250, kickBeat, kickBeat);

  arp = arpeggio.left.get(1)*750;
  arShape.display(arp, arp, arp);
}

