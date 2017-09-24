import de.looksgood.ani.*;
import de.looksgood.ani.easing.*;
import controlP5.*;


ControlP5 cp5;
Circle circle;

float w = width/2;
float h = height/2;
float rad = 100;
color bColor = color(255, 0, 0);

void setup() {
  size(600, 600);
  Ani.init(this);
  circle = new Circle(width/2, height/2, rad);
  cp5 = new ControlP5(this);


  cp5.addBang("turnOn")
    .setValue(0)
      .setPosition(50, 50)
        .setSize(50, 50);

  cp5.addBang("turnOff")
    .setValue(0)
      .setPosition(50, 150)
        .setSize(50, 50);
}

void draw() {

  background(0);
  //circle.run();
  ellipse(width/2, height/2, rad, rad);
  //print(rad+"\n");
}

public void controlEvent(ControlEvent theEvent) {
  println(theEvent.getController().getName());
  
  if(theEvent.getController().name()=="turnOn"){
    Ani.to(this, 1.5, "rad", 200);
  }
  
  if(theEvent.getController().name()=="turnOff"){
    Ani.to(this, 1.5, "rad", 100);
  }
}

class Circle {
  float x, y;
  float radius;

  Circle(float xpos, float ypos, float r) {
    x = xpos;
    y = ypos;
    radius = r;
  }

  void run() {
    display();
  }
  void display() {  
    fill(255);
    ellipse(x, y, radius, radius);
  }
}

