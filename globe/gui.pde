float arrowSize = 1;
float a = 100;
int timer;
float tyPos=-340;

void gui() {
  hint(DISABLE_DEPTH_TEST);
  cam.beginHUD();
  PosB.draw();
  textBox.display(tyPos);
  cam.endHUD();
  hint(ENABLE_DEPTH_TEST);
}

public void resetCamera() {
  cam.reset();
}

public void controlEvent(ControlEvent theEvent) {
  if (theEvent.getController().name()=="GraphicsON") {
    //    print(arrowSize+"\n");

    Ani.to(this, .5, "arrowSize", 1.0, Ani.BOUNCE_OUT);
    Ani.to(this, .5, "a", 255);
  }
  if (theEvent.getController().name()=="GraphicsOFF") {
    //    print(arrowSize+"\n");
    Ani.to(this, .5, "arrowSize", 0.0, Ani.QUAD_OUT);
    Ani.to(this, .5, "a", 0);
  }
  
  if (theEvent.getController().name()=="showInfo") {
    Ani.to(this, 1, "tyPos", 0);  
  }
  if (theEvent.getController().name()=="hideInfo") {
    Ani.to(this, 1, "tyPos", -340);  
  }
}

