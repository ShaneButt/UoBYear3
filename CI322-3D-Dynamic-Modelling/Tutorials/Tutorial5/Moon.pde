class Moon
{
  float radius, angle, distance, posX, posY, posZ;
  color colour;
  Planet parentPlanet;
  
  Moon(float radius, float angle, float distance, color colour, Planet parentPlanet)
  {
    this.radius = radius;
    this.angle = angle;
    this.distance = distance;
    this.colour = colour;
    this.parentPlanet = parentPlanet;
  }
  
  void display()
  {
    pushMatrix();
    posX = sin(angle);
    posZ = cos(angle);
    
    float speed = 3 / distance;
    
    translate( 
      (posX * distance) + (parentPlanet.posX * parentPlanet.distance), 
      (posX * distance), 
      (posZ * distance) + (parentPlanet.posZ * parentPlanet.distance)
    );
    
    fill(colour);
    smooth();
    sphere(radius);
    
    angle += speed;
    popMatrix();
  }
}
