import controlP5.*;

ControlP5 cp5;

int myColor = color(255);
int c1, c2;
float n;

float xPos = width/2 - 150;
float x1, x2;

void setup() {
  size(600, 600);
  noStroke();
  cp5 = new ControlP5(this);

  cp5.addButton("butt01")
    .setValue(0)
      .setPosition(width/2, height/2)
        .setSize(100, 50)
          ;

  cp5.addButton("butt02")
    .setValue(0)
      .setPosition(width/2, height/2+100)
        .setSize(100, 50)
          ;
}

void draw() {
  //background(50);
  fill(255, 255, 255, 50);
  rect(0, 0, width, height);
  fill(myColor);
  myColor = lerpColor(c1, c2, n);
  xPos = lerp(x1, x2, n);
  rect(xPos, height/2-150, 100, 50);
  n += (1-n) * 0.1;
}

public void controlEvent(ControlEvent theEvent) {
  println(theEvent.getController().getName());
  n=0;
}

public void butt01(int theValue) {
  println("the value of butt01 is " + theValue);
  c1 = c2;
  c2 = color(0, 0, 255);
  
  x1 = x2;
  x2 = width/2 +150;
}

public void butt02(int theValue) {
  println("the value of butt02 is " + theValue);
  c1 = c2;
  c2 = color(255, 0, 0);
  
  x1 = x2;
  x2 = width/2 -150;
}

