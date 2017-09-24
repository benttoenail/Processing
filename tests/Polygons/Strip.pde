class Strip {
  PShape s;
  PVector loc;
  PVector space;
  ArrayList<PVector> ori;
  float z;

  Strip()
  {
    loc = new PVector(0, 0);
    space = new PVector(20, 0);
    ori = new ArrayList<PVector>();

    s = createShape();
    s.beginShape(QUAD_STRIP);
    for (int i = 0; i < 10; i++) {
      loc.add(space);
      s.vertex(loc.x, loc.y);
      s.vertex(loc.x, loc.y - 10);
    }
    s.endShape(CLOSE);

    for (int i = 0; i < s.getVertexCount (); i++) {
      PVector v = s.getVertex(i);
      ori.add(v);
    }
  }

  void display(float x, float y)
  {
    translate(x, y);
    shape(s);
  }

  //move verts in random directions
  void wiggle()
  {
    for (int i = 0; i < s.getVertexCount (); i++) {
      PVector v = s.getVertex(i);
      v.x += random(-1, 1);
      v.y += random(-1, 1);
      s.setVertex(i, v);
    }
  }
  
  //move two verts in the z-axis
  void moveVerts()
  {
    float x = mouseX;
    s.setVertex(18, 230, 0, x);
    s.setVertex(19, 230, 0, x);
  }
  
}

