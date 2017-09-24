

void setup()
{
  size(600, 600, P3D);
}
float rotX = 1;
void draw()
{

  background(1);
  perspective(0.5, 1, 0.01, 100);
  camera(
  0, 30, 60,
  0, 0, 0,
  0, 1, 0
  );
  
  
  rotX = rotX + .005;
  rotateX(rotX);
  rotateY(rotX);
  
  final int slice = 22;
  final int ring = 22;
  final int radius = 8;

  int id = 0;
  
  //
  for (int i = 0; i < slice; i++)
  {
    float theta = (1.0 * i / slice) % 1;
    theta = PI * (theta - 0.5); //This creates half cirlcle
    
    for (int j = 0; j < ring; j ++)
    {
      float phi = 2 * PI * j / ring; //Calculates ring Angles
      
      float s = cos(theta);
      float l = radius;
      
      pushMatrix();
      rotateY(phi); //Rotates rings in Y
      rotateX(-theta);//Rotates cube
      translate(0, 0, l); //Push cube out in Z 
      box(s, s, s);
      popMatrix();
      
    }
  }
}