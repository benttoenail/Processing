class TextBox {
  String s = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";  
  float yPos;

  TextBox() {
  }

  void display(float y) {
    
    pushMatrix();
    fill(0, 75);
    stroke(0);
    strokeWeight(10);
    strokeJoin(ROUND);
    rect(750, y, 200, 320);
    fill(255);

    textSize(15);
    text(s, 755, y+20, 200, 300);    
    popMatrix();
    noStroke();
    strokeWeight(2);
    
  }
}

