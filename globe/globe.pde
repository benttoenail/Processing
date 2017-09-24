import de.looksgood.ani.*;
import de.looksgood.ani.easing.*;
import processing.opengl.*;
import controlP5.*;
import saito.objloader.*;
import peasy.*;

PeasyCam cam;
ControlP5 PosB;
OBJModel earth;
OBJModel arrowOBJ;
TextBox textBox;

//testing floats 
float latitude = 36.6;
float longitude = -100;

PVector NAmerica = new PVector(36.6, -100);
PVector Spain = new PVector(40.49, -3.69);
PVector India = new PVector(22.0, 77.51);
PVector[] locations;

float x, y, z;

//floats for drawing curves
//only a temp setup - will be more streamlined
float x1, y1, z1;
float x2, y2, z2;
float x3, y3, z3;

float r = 50;//radius of sphere
float rot;//for arrow rotation

Arrow arrow;

void setup() {
  size(1000, 750, OPENGL);
  Ani.init(this);
  PosB = new ControlP5(this);
  textBox = new TextBox();

  PVector[] locations = {
    NAmerica, Spain, India
  };

  earth = new OBJModel(this, "earthGeo.obj", "relative", POLYGON);
  arrowOBJ = new OBJModel(this, "arrow_geo.obj", "relative", POLYGON);

  earth.scale(r);
  earth.enableDebug();

  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(140);
  cam.setMaximumDistance(400);
  cam.setSuppressRollRotationMode();

  PosB.addButton("GraphicsON")
    .setValue(0)
      .setPosition(0, 0)
        .setSize(75, 50)
          ;

  PosB.addButton("GraphicsOFF")
    .setValue(0)
      .setPosition(76, 0)
        .setSize(75, 50)
          ;

  PosB.addButton("resetCamera")
    .setValue(0)
      .setPosition(0, 52)
        .setSize(75, 50)
          ;

  PosB.addButton("showInfo")
    .setValue(0)
      .setPosition(200, 0)
        .setSize(50, 50)
          ;

  PosB.addButton("hideInfo")
    .setValue(0)
      .setPosition(251, 0)
        .setSize(50, 50)
          ;
  PosB.setAutoDraw(false);
}


void draw() {

  background(150); 
  gui();
  LatLongArrows();
  earth.draw();

  noFill();

  LatLongLines();

  noStroke();
  fill(100, 100, 255);
}


void LatLongArrows() {
  PVector[] locations = {
    NAmerica, Spain, India
  };

  for (int i = 0; i < locations.length; i++) {
    float lat = -locations[i].x * PI/180;
    float lon = locations[i].y * PI/180;

    x = -r * cos(lat) * cos(lon);
    y = r * sin(lat);
    z = r * cos(lat) * sin(lon);

    rot+=.05;
    arrow = new Arrow(x, y, z);
    arrow.display(arrowSize, rot);
  }
}

//Throw this expression within the classes themselves so you wont 
//have so much code to deal with

void LatLongLines() {
  PVector[] locations = {
    NAmerica, Spain, India
  };

  float lat1 = -NAmerica.x * PI/180;
  float lon1 = NAmerica.y * PI/180;

  x1 = -r * cos(lat1) * cos(lon1);
  y1 = r * sin(lat1);
  z1 = r * cos(lat1) * sin(lon1);

  float lat2 = -Spain.x * PI/180;
  float lon2 = Spain.y * PI/180;

  x2 = -r * cos(lat2) * cos(lon2);
  y2 = r * sin(lat2);
  z2 = r * cos(lat2) * sin(lon2);

  float lat3 = -India.x * PI/180;
  float lon3 = India.y * PI/180;

  x3 = -r * cos(lat3) * cos(lon3);
  y3 = r * sin(lat3);
  z3 = r * cos(lat3) * sin(lon3);

  stroke(255, 0, 0, a);
  noFill();
  curve(-x1, -y1, -z1, x1, y1, z1, x2, y2, z2, -x2, -y2, -z2);
  stroke(100, 100, 255, a);
  curve(-x2, -y2, -z2, x2, y2, z2, x3, y3, z3, -x3, -y3, -z3);
}




/* save this section!!!
 //calculate latitude and longitude corrdnates 
 void LatLong() {
 float lat = -latitude * PI/180;
 float lon = longitude * PI/180;
 
 x = -r * cos(lat) * cos(lon);
 y = r * sin(lat);
 z = r * cos(lat) * sin(lon);
 }
 *///END

