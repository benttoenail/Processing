class Arrow {
  float x, y, z;
  float size;
  PVector location;

   Arrow(float xPos, float yPos, float zPos) {
    x = xPos;
    y = yPos;
    z = zPos;
  }  

  void display(float s, float r) { 
    pushMatrix();
    translate(x, y, z);
    rotateY(r);
    scale(s, s, s);
    arrowOBJ.draw();
    arrowOBJ.scale(1);  
    popMatrix();
  }
}

