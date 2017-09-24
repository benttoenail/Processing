//this object is spawned in a random location
//the objecttive is to push the mainCircle in this object's diameter for 3 seconds
//then you win the game

class TargetCircle {
  public PVector location;
  float radius;
  boolean withinCircle;
  public boolean youWon;
  int counter = 0;

  TargetCircle() {
    withinCircle = false;
    youWon = false;
    radius = 120;
    //the circle keeps spawing with some area outside of the playable game zone
    location = new PVector(random(radius, width-2), random(radius, height-radius));  
    
  }

  void run() {
    display();
    YouWin();
  }


  void display() {
    if (withinCircle) {
      stroke(255, 100, 100);
    } else {
      stroke(100, 100, 255);
    }
    strokeWeight(5);
    noFill();  
    ellipseMode(CENTER);
    ellipse(location.x, location.y, radius, radius);
  }


  void YouWin() {
    PVector inCircle = PVector.sub(circ.location, location);
    //PVector inCircleY = PVector.sub(circ.location.y, tarCirc.location.y);  
    //print(inCircle.x+"\n");

    //check to see if within the winning circle
    if (inCircle.x <= 5 && inCircle.x >= -5 && inCircle.y <= 5 && inCircle.y >= -5) {
      withinCircle = true;
    } else {
      withinCircle = false;
    }
    
    //create addHock timer
    if (withinCircle) {
      counter++;
      if(counter == 160){
          youWon = true;
      }
    }
    if(!withinCircle){
      counter = 0; 
    } 
  }
}

