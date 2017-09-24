class CircleObject
{
  float radius = 50;
  float xPos;
  float yPos;
  float theta;
  float amplitude = 10;
  float speed;
  float r;

  CircleObject(float _r) {
    radius = 50;
    xPos = 100;
    yPos = 100;
    r = _r;
  }

  void run(float _x)
  {
    calculate();
    display(_x);
  }


  void display(float _x)
  {
    theta += .1;
    float x = theta; 
    float c = sin(x*r) * (r*100);

    float d = radius*2;
    fill(c+100, c, c, 50);
    //stroke(c, c, c);
    ellipse(xPos + _x, yPos, d, d);
  }

  //Calculate the movement of the Spheres
  void calculate()
  {
    radius = radius - 0.1;
    if (radius <= 0) {
      radius = 0;
    }

    theta += 0.2;
    float x = theta;
    xPos = cos(x) * amplitude + sin(x*r)*amplitude*2.0 + sin(x*r)*amplitude;

    speed = speed + 1;

    yPos = speed + cos(xPos * 0.05)* 25 + sin(xPos * 0.05) * 25;
  }
}