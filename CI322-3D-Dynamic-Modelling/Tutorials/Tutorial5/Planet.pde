class Planet
{
  float radius,angle,distance,posX,posZ,posY;
  color colour;
  
  Planet(float radius, float angle, float distance, color colour)
  {
    this.radius = radius; // radius of the shape
    this.angle = angle; // angle offset 
    this.distance = distance; // distance from origin
    this.colour = colour; // colour to fill
  }
  
  void display()
  {
    pushMatrix();
    posX = sin(angle);
    posZ = cos(angle);
    
    float speed = 10 / distance;
    
    translate(posX * distance, 0, posZ * distance);
    fill(colour);
    smooth();
    sphere(radius);
    
    angle += speed;
    popMatrix();
  }
}
