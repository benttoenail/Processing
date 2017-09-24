class Chart {
  String month;
  float food;
  float out;
  float other;
  float total;

  int ySpace = 560;

  float factor = 0.5;

  Chart(String m, int _food, int _out, int _other)
  {
    month = m;
    food = _food * -1 * factor;
    out = _out * -1 * factor;
    other = _other * -1 * factor;
    total = food + out + other * factor;
  }

  void display()
  {
    //month
    fill(255, 255, 255);
    text(month, 20, ySpace + 20);

    //food
    fill(200, 50, 50);
    rect(20, ySpace, 20, food);
    fill(255,255, 255);
    pushMatrix();
    translate(33, ySpace - 10);
    rotate(HALF_PI * -1);
    text("FOOD", 0, 0);
    popMatrix();

    //out
    fill(50, 100, 250);
    rect(45, ySpace, 20, out);
    fill(255,255, 255);
    pushMatrix();
    translate(58, ySpace - 10);
    rotate(HALF_PI * -1);
    text("OUT", 0, 0);
    popMatrix();

    //other
    fill(100, 225, 100);
    rect(70, ySpace, 20, other);
    fill(255,255, 255);
    pushMatrix();
    translate(83, ySpace - 10);
    rotate(HALF_PI * -1);
    text("OTHER", 0, 0);
    popMatrix();

    //total
    fill(255, 255, 50);
    rect(95, ySpace, 20, total);
    fill(255, 0, 0);
    pushMatrix();
    translate(108, ySpace - 10);
    rotate(HALF_PI * -1);
    text("TOTAL", 0, 0);
    popMatrix();
    
    //seperation line
    stroke(255, 255, 255);
    strokeWeight(1);
    line(126, ySpace, 126, 0);
    noStroke();
  }
}