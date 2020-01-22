float mouseX1,mouseX2;
float mouseY1, mouseY2;

float eyeX,eyeY,eyeZ;
float upX, upY, upZ;

float fov = PI/2;
float angle = 0;
int xMin;
int xMax;
float dist;
float D;
PShape barn;

void setup()
{
  size(600,600,P3D);
  xMin = 0;
  xMax = width;
  dist = xMax - xMin;
  D = (dist/2) / tan(fov/2);
  eyeX = 1.25 * width;
  eyeY = height/2;
  eyeZ = 0.125 * width;
  upX = 0;
  upY = 1;
  upZ = 0;
  
  makeBarn();
  barn.translate(width/4, 3*height/4);
}

void draw()
{
  camera(eyeX, eyeY, eyeZ, width/2, height/2, 75, upX, upY, upZ);
  background(0);
  shape(barn);
  barn.rotateY(radians(1));
}

void makeBarn()
{  
  int[] strokeColor = { 220,200,200 }; // off-white
  int[] fillColor1 = { 0, 117, 32 }; // dark green
  int[] fillColor2 = { 117, 0, 32 }; // dark red
  int[] fillColor3 = { 0, 32, 117 }; // dark blue
  int[] fillColor4 = { 255, 175, 135 }; // macaroni and cheese
  int[] fillColor5 = { 255, 142, 114 }; // salmon
  int[] fillColor6 = { 76, 224, 179 }; // eucalyptus
  int[] fillColor7 = { 30, 194, 255 }; // spiro disco ball
  int[] fillColor8 = { 46, 41, 78 }; // space cadet
  int[] fillColor9 = { 255, 212, 0 }; // spiro disco ball
  int[] fillColor10 = { 244, 34, 114 }; // razzmatazz
  int[] fillColor11 = { 191, 219, 247 }; // pale aqua
  int[] fillColor12 = { 194, 234, 189 }; // tea green
  //int[] fillColor13 = { 244, 132, 152 }; // tulip
  int strokeWeight = 2;
  
  Point P0 = new Point(new int[] { 0, 0, 0 });
  Point P1 = new Point( new int[] {width/2, 0, 0});
  Point P2 = new Point(new int[] {width/2, 0, (width/4)/3});
  Point P3 = new Point(new int[] {width/2, -2*(width/3)/3, (width/4)/3});
  Point P4 = new Point(new int[] {width/2, -2*(width/3)/3, 0});
  Point P5 = new Point(new int[] {width/2, 0, 2*(width/4)/3});
  Point P6 = new Point(new int[] {width/2, 0, width/4});
  Point P7 = new Point(new int[] {width/2, -2*(width/3)/3, width/4});
  Point P8 = new Point(new int[] {width/2, -2*(width/3)/3, 2*(width/4)/3});
  Point P9 = new Point(new int[] {width/2, -width/3, width/4});
  Point P10 = new Point(new int[] {width/2, -width/3, 0});
  Point P11 = new Point(new int[] {width/2, -width/2, (width/4)/2});
  Point P12 = new Point(new int[] { 0, -width/3, 0 });
  Point P13 = new Point(new int[] { 0, -width/3, width/4 });
  Point P14 = new Point(new int[] { 0, 0, width/4 });
  Point P15 = new Point(new int[] { 0, -width/2, (width/4)/2 });
  
  Point[] floor = { P0, P1, P6, P14 };

  Point[] flatRoof = { P12, P10, P9, P13 };
  // barn walls - longest
  Point[] wallRight = { P0, P1, P10, P12 };
  Point[] wallLeft = { P14, P6, P9, P13 }; 
  // the front wall pieces
  Point[] frontWallLeftPiece = { P5, P6, P7, P8 };
  Point[] frontWallRightPiece = { P1, P2, P3, P4 };
  Point[] frontWallTopPiece = { P4, P7, P9, P10 };
  Point[] frontRoofWallTriangle = { P9, P10, P11 };
  // the door
    //Point[] door = { P2, P3, P8, P5 };
  // the roof pieces
  Point[] roofLeft = { P9, P13, P15, P11 };
  Point[] roofRight = { P10, P12, P15, P11 };
  // the backwall pieces
  Point[] backRoofWallTriangle = { P12, P13, P15 };
  Point[] backWall = { P0, P14, P13, P12 };
  
  barn = createShape(GROUP);
  
  barn.addChild(shapeBuilder(floor, fillColor1, strokeColor, strokeWeight));
  barn.addChild(shapeBuilder(backWall, fillColor2, strokeColor, strokeWeight));
  barn.addChild(shapeBuilder(wallRight, fillColor3, strokeColor, strokeWeight));
  barn.addChild(shapeBuilder(flatRoof, fillColor4, strokeColor, strokeWeight));
  barn.addChild(shapeBuilder(frontWallLeftPiece, fillColor5, strokeColor, strokeWeight));
  barn.addChild(shapeBuilder(frontWallRightPiece, fillColor6, strokeColor, strokeWeight));
  barn.addChild(shapeBuilder(frontWallTopPiece, fillColor7, strokeColor, strokeWeight));
  barn.addChild(shapeBuilder(frontRoofWallTriangle, fillColor8, strokeColor, strokeWeight));
  barn.addChild(shapeBuilder(backRoofWallTriangle, fillColor9, strokeColor, strokeWeight));
  barn.addChild(shapeBuilder(roofRight, fillColor10, strokeColor, strokeWeight));
  barn.addChild(shapeBuilder(roofLeft, fillColor11, strokeColor, strokeWeight));
  barn.addChild(shapeBuilder(wallLeft, fillColor12, strokeColor, strokeWeight));
  //barn.addChild(shapeBuilder(door, fillColor1, strokeColor, strokeWeight));
}

PShape shapeBuilder(Point[] points, int[] fillColor, int[] strokeColor, int strokeWeight)
{
  fill(fillColor[0], fillColor[1], fillColor[2]);
  stroke(strokeColor[0], strokeColor[1], strokeColor[2]);
  strokeWeight(strokeWeight);
  PShape shape = createShape();
  shape.beginShape();
  for(Point point : points) // list of points
  {
    shape.vertex(point.x, point.y, point.z); // point: x, y, z
  }
  shape.endShape(CLOSE);
  return shape;
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
       eyeX = 1.25 * width;
       eyeY = height/2;
       eyeZ = 0.125 * width;
       upX = 0;
       upY = 1;
       upZ = 0;
       break;
     case 121: // Y
       eyeX = width/2;
       eyeY = -height/4;
       eyeZ = 0.125 * width;
       upX = -1;
       upY = 0;
       upZ = 0;
       break;
     case 122: // Z
       eyeX = width/2;
       eyeY = height/2;
       eyeZ = -width/2;
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
