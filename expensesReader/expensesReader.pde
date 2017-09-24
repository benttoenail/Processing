
XML xml;
Chart[] chart;
float x = 0;
float y = 0;

void setup()
{
  size(900, 600, P3D);
  noStroke();


  xml = loadXML("expenses.xml");
  XML[] children =xml.getChildren("Month");
  int count = children.length;
  chart = new Chart[count];

  int index = 0;
  for (int i = 0; i < count; i++) {
    String month = children[i].getString("id");

    XML FOOD  = children[i].getChild("food");
    XML OUT   = children[i].getChild("out");
    XML OTHER = children[i].getChild("other");

    int food = FOOD.getIntContent();  
    int out  = OUT.getIntContent();
    int other= OTHER.getIntContent();
    chart[index++] = new Chart(month, food, out, other);
  }
}

void draw()
{  
  camera(width+x, y, mouseY, 
    width+x, y, 0, 
    0, 1.0, 0);

  background(150);

  pushMatrix();
  for (Chart c : chart) {
    c.display();
    translate(120, 0);
  }
  popMatrix();
 
  camControls();
}


void camControls()
{
  if (keyPressed) {
    if (keyCode == RIGHT) {
      x += 10;
    }
    if (keyCode == LEFT) {
      x -= 10;
    }
    if (keyCode == UP) {
      y -= 10;
    }
    if (keyCode == DOWN) {
      y += 10;
    }
  }
}