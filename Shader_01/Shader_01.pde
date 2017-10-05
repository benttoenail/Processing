
PShader shader;

void setup()
{
  size(900, 900, P2D);
  noStroke();

  shader = loadShader("lightexplosion.frag");
}

void draw()
{
  SetShaderProps();
  rect(0, 0, width, height);
  
  //saveFrame("lightExplosion_####.png");
}

void SetShaderProps()
{
  shader.set("u_resolution", float(width), float(height));
  shader.set("u_mouse", float(mouseX), float(mouseY));
  shader.set("u_time", millis() / 1000.0);
  shader(shader);
}