Star sun;
Planet earth;
Moon moon;
Planet mercury;
Planet venus;
PImage background;

float eyeX,eyeY,eyeZ,upX,upY,upZ;

void setup()
{
  this.sun = new Star(200, width/2, height/2, 0, color(255, 255, 0));
  this.earth = new Planet(75, PI, 600, color(0, 170, 50));
  this.moon = new Moon(25, PI/4, 110, color(200, 200, 200), this.earth);
  this.mercury = new Planet(50, 1.5 * PI, 420, color(200, 150, 150));
  this.venus = new Planet(30, PI/4, 320, color(170, 170, 100));
  
  eyeX = 0;
  eyeY = 0;
  eyeZ = width*1.5;
  upX = 0;
  upY = 1;
  upZ = 0;
  size(1200,900, P3D);
  background = loadImage("background.jpg");
}

void draw() 
{
  background(background);
  lights();
  pointLight(255, 255, 0, 0, 0, 1);
  camera(eyeX, eyeY, eyeZ, 0, 0, 0, 0, 1, 0);
  
  sun.display();
  earth.display();
  moon.display();
  mercury.display();
  venus.display();
}

void keyTyped()
{
  switch(int(key))
  {
     case 120: // X
       eyeX = width*1.5;;
       eyeY = 0;
       eyeZ = 0;
       upX = 0;
       upY = 1;
       upZ = 0;
       break;
     case 121: // Y
       eyeX = 0;
       eyeY = -height*1.5;
       eyeZ = 1;
       upX = -1;
       upY = 0;
       upZ = 0;
       break;
     case 122: // Z
       eyeX = 0;
       eyeY = 0;
       eyeZ = width*1.5;
       upX = 0;
       upY = 1;
       upZ = 0;
       break;
     case 113: // Q
       ortho();
       break;
     case 101: // E
       perspective();
       break;
  }
}
