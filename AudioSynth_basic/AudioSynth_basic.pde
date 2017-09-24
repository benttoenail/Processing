import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioOutput out;
Oscil wave;

void setup() {
  size(512, 300, P3D);

  minim = new Minim(this);
  out = minim.getLineOut();

  wave = new Oscil(440, 0.5f, Waves.SINE);
  wave.patch(out);
}

void draw() {
  background(0);
  stroke(255);
  strokeWeight(1);

  for (int i = 0; i < out.bufferSize () - 1; i++)
  {
    line( i, 50  - out.left.get(i)*50, i+1, 50  - out.left.get(i+1)*50 );
    line( i, 150 - out.right.get(i)*50, i+1, 150 - out.right.get(i+1)*50 );
  }

  // draw the waveform we are using in the oscillator
  stroke( 128, 0, 0 );
  strokeWeight(4);
  for ( int i = 0; i < width-1; ++i )
  {
    point( i, height/2 - (height*0.49) * wave.getWaveform().value( (float)i / width ) );
  }
}  


void mouseMoved()
{
  // usually when setting the amplitude and frequency of an Oscil
  // you will want to patch something to the amplitude and frequency inputs
  // but this is a quick and easy way to turn the screen into
  // an x-y control for them.
 
  float amp = map( mouseY, 0, height, 1, 0 );
  wave.setAmplitude( amp );
 
  float freq = map( mouseX, 0, width, 110, 880 );
  wave.setFrequency( freq );
}
 
void keyPressed()
{ 
  switch( key )
  {
    case '1': 
      wave.setWaveform( Waves.SINE );
      break;
 
    case '2':
      wave.setWaveform( Waves.TRIANGLE );
      break;
 
    case '3':
      wave.setWaveform( Waves.SAW );
      break;
 
    case '4':
      wave.setWaveform( Waves.SQUARE );
      break;
 
    case '5':
      wave.setWaveform( Waves.QUARTERPULSE );
      break;
 
    default: break; 
  }
}


