String filePath = "bg.jpg";
PImage img;
int posW = 0;
int boxSize = 100;
boolean returning = false;

float mouseX1,mouseX2;
float mouseY1, mouseY2;

float eyeX,eyeY,eyeZ;
float upX, upY, upZ;

float fov = PI/2;
int xMin = 0;
int xMax = 1200;
float dist = (xMax-xMin);
float D = (dist/2) / tan(fov/2);

void setup()
{
  size(1200,675, P3D);
  img = loadImage(filePath);
  eyeX = dist;
  eyeY = height/2;
  eyeZ = 0;
  upX = 0;
  upY = 0;
  upZ = 1;
}

void draw()
{
  camera(eyeX, eyeY, eyeZ, 0, height/2, 0, upX, upY, upZ);
  ambientLight(128,128,128);
  directionalLight(0,117,32, mouseX2-mouseX1, mouseY2-mouseY1, 10);
  pointLight(200, 0, 200, 0, 0, 0);
  background(img);
  
  translate(posW, height/2, (boxSize/2));
  fill(255);
  box(boxSize);
  
  if ( (posW + 1 < (width/2)-boxSize) && !(returning) )
  {
    posW += 1;
  } else
  {
     returning = true;
     if (posW-1 == -(width/2)+boxSize) returning = false;
     
     posW -= 1;
  }
  
}

void mousePressed()
{
  mouseX1 = mouseX;
  mouseY1 = mouseY;
}

void mouseReleased()
{
  mouseX2 = mouseX;
  mouseY2 = mouseY;
}

void keyTyped()
{
  switch(int(key))
  {
     case 120: // X
       eyeX = 0;
       eyeY = height/2;
       eyeZ = dist;
       upX = 0;
       upY = 1;
       upZ = 0;
       break;
     case 121: // Y
       eyeX = 0;
       eyeY = -height;
       eyeZ = 0;
       upX = -1;
       upY = 0;
       upZ = 0;
       break;
     case 122: // Z
       eyeX = dist;
       eyeY = height/2;
       eyeZ = 0;
       upX = 0;
       upY = 0;
       upZ = 1;
       break;
     case 113: // Q
       ortho();
       break;
     case 101: // E
       perspective();
       break;
  }
}
