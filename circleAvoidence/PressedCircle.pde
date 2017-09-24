// - - -  - - - - -  - -
class PressedCircle {
  float r = 50;
  float rotate = 1;

  void run() {
    rotate +=1;
    display();
    //drawLine();
    drawPoints(rotate);
  }

  void display() {
    noStroke();
    fill(100, 100, 255);
    ellipse(mouseX, mouseY, r, r);
  }

  void drawLine() {
    stroke(0);
    strokeWeight(1);
    line(circ.location.x, circ.location.y, mouseX, mouseY);
  }

  // draw a circle of point around main circle
  void drawPoints(float r) {
    strokeWeight(5);

    float radius = 70;
    int numPoints = 20;
    float angle = TWO_PI/(float)numPoints;

    pushMatrix();
    translate(circ.location.x, circ.location.y);
    if (!keyPressed) {
      rotate(-r);
      stroke(150, 150, 200);
    } else {
      rotate(r);
      stroke(150, 150, 0);
    }
    for (int i =0; i < numPoints; i++) {
      point(radius*sin(angle*i), radius*cos(angle*i));
    }
    popMatrix();
  }
}

