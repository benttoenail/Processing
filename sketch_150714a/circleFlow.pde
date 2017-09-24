class circleFlow {

  PVector vel;
  PVector loc;
  PVector accl;
  float radius;
  PVector mouseLoc;

  circleFlow(float r, PVector ml )
  {
    mouseLoc = ml;
    vel = new PVector(1, 1);
    loc = new PVector();
    accl = new PVector(random(0, 0.01), random(0, 0.01));
    radius = r;
  }

  void run(ArrayList<circleFlow> flower )
  {
    render();
    update();
  }

  void render()
  {
    pushMatrix();
      translate(mouseLoc.x, mouseLoc.y);
    stroke(255, 0, 0);
    ellipse(loc.x, loc.y, radius, radius);
    popMatrix();
  } 

  void update()
  {     
    //decrement the radius of the circle
    float radDec = .25;
    radius = radius - radDec;
    if (radius <= 0) {
      radius = 0;
    }

    //decelerate the sphere
    vel.sub(accl);
    loc.add(vel);

    if (vel.x <= 0 && vel.y <= 0) {
      vel = new PVector(0, 0);
    }

    //  print(vel.x +"\n");
  }
}

