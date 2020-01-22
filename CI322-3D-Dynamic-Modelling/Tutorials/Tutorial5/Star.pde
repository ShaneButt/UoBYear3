class Star
{
  float radius, posX, posY, posZ;
  color colour;
  PShape triangleArray;
  
  Star(float radius, float posX, float posY, float posZ, color colour)
  {
    this.radius = radius;
    this.posX = posX;
    this.posY = posY;
    this.posZ = posZ;
    this.colour = colour;
    this.triangleArray = formTriangleArray(12);
  }
  
  void display()
  {
    pushMatrix();
    noStroke();
    translate(0,0,1);
    fill(colour);
    smooth();
    sphere(radius);
    popMatrix();
    shape(this.triangleArray);
  }
  
  PShape formTriangleArray(int numTris)
  {
    PShape triArray = createShape(GROUP);
    
    for(float f = 2*PI; f > 0; f -= (2*PI)/(numTris))
    {
      float angle = f;
            
      float posX1 = this.radius * cos(angle); // point 1
      float posY1 = this.radius * sin(angle);
            
      float posX2 = (this.radius*1.25) * cos(angle + PI/8); // point of triangle outside sphere
      float posY2 = (this.radius*1.25) * sin(angle + PI/8);
           
      float posX3 = this.radius * cos(angle + PI/4); // point 3
      float posY3 = this.radius * sin(angle + PI/4);
            
      PShape tri;
      fill(255,255,0);
      noStroke();
      tri = createShape();
      tri.beginShape();

      tri.vertex(posX1, posY1, 1);
      tri.vertex(posX2, posY2, 1);
      tri.vertex(posX3, posY3, 1);

      tri.endShape(CLOSE);

      triArray.addChild(tri);
    }    
    return triArray;
  }
}
