//call this class to celebreate a hard earned victory!!

class Celebration {
  float y;

  Celebration() {
    y = -500;
  }

  void run() {
    display();
    YouWon(y);
  }

  void display() {
    pushMatrix();
    rectMode(CENTER);
    strokeJoin(ROUND);
    strokeWeight(10);
    stroke(175, 175, 255);
    translate(width/2, y);
    fill(0, 0, 0, 100);
    rect(0, 0, 150, 50);
    fill(255);
    textMode(CENTER);
    textSize(23);
    text("You won!!", -50, 5);
    popMatrix();

    if (tarCirc.youWon) {
      Ani.to(this, 1, "y", 50);
    }
  }

  void YouWon(float y) {
    if (tarCirc.youWon) {
      print("youWon!!+\n");
    }
  }
}

