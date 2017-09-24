
LineGroup lGrp;

void setup()
{
  size(960, 600);
  background(150);
  lGrp = new LineGroup();

  for (int i =0; i < width; i++) {
    Lines l = new Lines(i, height/2);
    lGrp.addLine(l);
  }
}

void draw()
{
  if (mousePressed) {
    for (int i =0; i < 25; i++) {
      Lines l = new Lines(mouseX, mouseY);
      lGrp.addLine(l);
    }
  }
  lGrp.run();
}

