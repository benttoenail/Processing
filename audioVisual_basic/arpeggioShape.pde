class arpeggioShape {
  float col;
  float x;
  float y;
  
  arpeggioShape(float xPos, float yPos) {
    x =xPos;
    y=yPos;
    
  }
  
  void display( float w, float h,  float c){
    pushMatrix();
    col = 100;
    fill(col, col *c, col/c);
    rectMode(CENTER);
    rect(x, y, w, h);
    popMatrix();  
  }
}

