
class cube {
  float x, y;
  float rot, r;
  float t = 100;
  float b = 0;
  float boxSize;
  float spinRate = .1;
  // boolean overBox = false

  cube(float xPos, float yPos) {
    x = xPos;
    y = yPos;
    boxSize= 100;
  }

  void run() {
    display();
    interact();
  }
  void display() {    
    pushMatrix();
    translate(x, y);
    rotateY(radians(rot));
    box(boxSize, boxSize, 1);
    popMatrix();
  }
  
  void interact() {
    if (mouseX > x-boxSize && mouseX < x+boxSize &&
      mouseY > y-boxSize && mouseY < y+boxSize) {  
      spin();
    }
  }

  void spin() {
    float r = t;
    if (t>0) {
      t -= 1; //decummulation 
    }
    rot += r*spinRate;
    //print(r+"\n");
    print(rot+"\n");
 
  }
}  

