//moving lines
ArrayList Lines;

void setup() {
  smooth();
  size(600, 600);
  background(150);
  Lines = new ArrayList();

  for (int i = 0; i < 50; i++) {
    Line L = new Line(width/2, height/2, width/2, height/2);
    Lines.add(L);
  }
}

void draw() {
  for (int i = 0; i < 50; i++) {
    Line L = (Line)Lines.get(i);
    L.run();
  }
}

