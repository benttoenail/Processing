class FlowerShape {
  ArrayList<circleFlow> flower;
  int w;
  int h;
  float xPos;
  float yPos;
  PVector location;
  
  FlowerShape(float _x, float _y)
  {
    location = new PVector();
    xPos = _x;
    yPos = _y;
    flower = new ArrayList<circleFlow>();
  }
  
  void run()
  {
    int x = 10;
    for(circleFlow c : flower){
      pushMatrix();
      //translate(xPos, yPos);
      rotate(10+x);
      c.run(flower);
      popMatrix();
      x += 10;
    }
  }
  
  void addShape(circleFlow c)
  {
    flower.add(c);
  }
  
  PVector findLocation()
  {
    location.x = mouseX;
    location.y = mouseY;
    return location;
  }
  
}

