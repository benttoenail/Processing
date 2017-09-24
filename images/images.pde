PImage img;

void setup(){
  size(600, 600);
  img = loadImage("BY_Lines.png");  
}

void draw(){
  
  rect(100, 100, 100, 100);
  image(img, 0, 0);
}
