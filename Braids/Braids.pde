
float w;
float h; 
ArrayList circles;

//CircleObject circle;

void setup()
{
  size(600, 600);
  circles = new ArrayList();
  background(255, 255, 0);
  w = width;
  h = height;
  
  for(int i =0; i < 10; i++)
  {
    float _r = random(.1, .9);
    CircleObject circle = new CircleObject(_r);
    circles.add(circle);
  }
  
  smooth();
  noStroke();
  
}

float radius = 50;
float xSin;
float theta;

void draw()
{
  
  for(int i =0; i < 10; i++)
  {
    CircleObject c = (CircleObject)circles.get(i);
    c.run(i * 100);
  }
  
}