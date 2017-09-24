
FlowerShape flow;
PVector mousePos;
void setup()
{
  //noStroke();
  size(870, 600);
  background(150);
  mousePos = new PVector(mouseX, mouseY);
  flow = new FlowerShape(width/2, height/2);
  for (int i = 0; i < 10; i++) {
    circleFlow c = new circleFlow(50, mousePos);
    flow.addShape(c);
  }
}

void draw()
{
  flow.run();
}

void mouseClicked()
{
  PVector pos = new PVector(mouseX, mouseY);
  for (int i = 0; i < 10; i++) {   
    circleFlow c = new circleFlow(30, pos);
    flow.addShape(c);
  }
}

