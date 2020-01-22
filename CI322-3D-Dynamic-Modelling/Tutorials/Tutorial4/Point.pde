class Point 
{
  int x;
  int y;
  int z;
  
  public Point()
  {
    this.x = 0;
    this.y = 0;
    this.z = 0;
  }
  
  public Point(int x, int y, int z)
  {
     this.x = x;
     this.y = y;
     this.z = z;
  }
  
  public Point(int[] coordinates)
  {
    this.x = coordinates[0];
    this.y = coordinates[1];
    this.z = coordinates[2];
  }
}
