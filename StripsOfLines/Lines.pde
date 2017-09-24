class Lines {
  PVector loc;
  PVector loc2;
  PVector vel;
  PVector vel2;
  PVector accl;
  PVector accl2;
  PVector sine;
  float x, y, c;
  float theta;

  Lines(float x_, float y_)
  {
    loc = new PVector(0, 0);
    loc2 = new PVector(0, 0);
    vel = new PVector(0, 0);
    vel2 = new PVector(0, 0);
    sine = new PVector(0, 0);
    x = x_;
    y = y_;
  }

  void run(ArrayList<Lines> lines )
  {
    update();
    display();
  }


  void update()
  {
    theta += 0.005;
    
    accl = PVector.random2D();
    accl2 = PVector.random2D();
    accl.mult(.005);
    accl2.mult(.005);   

    vel.add(accl);
    vel2.add(accl2);


    loc.add(vel);
    loc2.add(vel2);
    
    c = sin(theta)* 255;
  }

  void display()
  {
    pushMatrix();
    translate(x, y);
    stroke(c, c, c, 7);
    line(loc.x, loc.y, loc2.x, loc2.y);
    popMatrix();
  }
}

