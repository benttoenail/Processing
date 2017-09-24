cube myCube;
float x;
float y;

void setup() {
  x = width/2;
  y = height/2;
  size(600, 600, P3D);
  myCube = new cube(x, y);
}

void draw() {
  background(50);
  myCube.run();
}


