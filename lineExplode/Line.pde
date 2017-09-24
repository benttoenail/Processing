class Line {
  PVector locationA;
  PVector locationB;
  PVector velocityA;
  PVector velocityB;  
  PVector rA;
  PVector rB;
  float c;

  Line(float xPA, float yPA, float xPB, float yPB, float c) {
    locationA = new PVector(xPA, yPA);
    locationB = new PVector(xPB, yPB);
    velocityA = new PVector();
    velocityB = new PVector();
  }

  void run() {
    display();
    update();
  }

  void display() {
    stroke(c, c, 255, 10);
    line(locationA.x, locationA.y, locationB.x, locationB.y);
  }

  void update() {
    
    //c+=.1;
    rA = PVector.random2D();
    rB = PVector.random2D();
    
    rA.mult(10);
    rB.mult(10);
    
    locationA.add(rA);
    locationB.add(rB);
    
    
  }
}


