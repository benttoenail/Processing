
Strip st;


void setup()
{
  size(1200, 600, P3D);
  st = new Strip();
}

void draw()
{
  background(150);
  st.display(400, 300);
  st.moveVerts();
  //st.wiggle();
}



