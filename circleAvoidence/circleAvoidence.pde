//I want to have a circle move around the page bouncing off the edges and 
//when I click somewhere on the page another circle pops up
//while drawing a line from the bouncing circle to the pressed circle
//and while I push the Pressedcircle's location towards the bouncing circle
//I want the bouncing circle to avoid it
//and you have to push the circle onto a specific point and keep it there
//for 3 seconds   - if you do you win!!

import de.looksgood.ani.*;
import de.looksgood.ani.easing.*;

Circle circ;
PressedCircle pressCirc;
TargetCircle tarCirc;
Celebration celebrate;

float x = 300;
float y = 300;

void setup() {
  size(600, 600);
  circ = new Circle(x, y);
  pressCirc = new PressedCircle();
  tarCirc = new TargetCircle();
  celebrate = new Celebration();
  Ani.init(this);
}

void draw() {
  background(100);
  circ.run();
  tarCirc.run();
  celebrate.run();

  if (mousePressed) {
    pressCirc.run();
  }
  
}









