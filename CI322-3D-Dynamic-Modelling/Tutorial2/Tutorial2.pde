float cameraZ = 1;
void setup()
{
  size(640,400, P3D);
}

void draw()
{
  background(0);
  
  translate(width/2, height/2, 0);
  stroke(0,150,50);
  fill(0, 117, 32);
  box(100);
  camera(cameraZ, mouseY, -mouseX, width/2, height/2, 0, 0, 1, 0);
}

void mouseWheel(MouseEvent e)
{
  cameraZ += e.getCount()*100;
}
