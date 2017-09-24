
// - - - - - -  - - - - -  -
public class Circle {
  float speed = 10;
  float radius = 100;
  public PVector location;
  PVector velocity;
  float maxForce;

  Circle(float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector(random(-2.5, 5), random(-3.5, 6));
    maxForce = 0.05;
  }

  void run() {
    update();
    display();
  }

  void display() {
    noStroke();
    fill(255);
    pushMatrix();
    ellipseMode(CENTER);
    translate(location.x, location.y);
    ellipse(0, 0, radius, radius);
    popMatrix();
  }

  //method to update location
  void update() {
    location.add(velocity); 

    if (location.x > width-radius/2 || location.x < 0 + radius/2 ) {
      velocity.x = velocity.x * -1;
    }
    if (location.y > height-radius/2 || location.y < 0 + radius/2) {
      velocity.y = velocity.y * -1;
    }
    PVector mousePos = new PVector (mouseX, mouseY);
    PVector distance = PVector.sub(location, mousePos);
    if (mousePressed && !keyPressed) {
      distance.normalize();
      distance.mult(maxForce);
      velocity.add(distance);
    }
    if (mousePressed && keyPressed) {
      distance.normalize();
      distance.mult(maxForce);
      velocity.sub(distance);
    }
  }
}
