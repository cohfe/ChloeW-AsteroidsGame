class Spaceship extends Floater
{
  public Spaceship(int x, int y) {
    corners = 8;  //the number of corners, a triangular floater has 3
    xCorners = new int[corners];
    yCorners = new int [corners];
    xCorners[0] = -10;
    yCorners[0] = -9;
    xCorners[1] = 30;
    yCorners[1] = 0;
    xCorners[2] = -10;
    yCorners[2] = 9;
    myColor = color(100, 100, 100);
    myCenterX = x;
    myCenterY = y; //holds center coordinates
    myXspeed = 0;
    myYspeed = 0; //holds the speed of travel in the x and y directions
    myPointDirection = 90; //holds current direction the ship is pointing in degrees
  }

  public void hyperspace(int x, int y)
  {
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = (int)(Math.random()*360);
    myCenterX = x;
    myCenterY = y;
  }

  public void turnLeft()
  {
    myPointDirection+=10;
  }

  public void turnRight()
  {
    myPointDirection-=10;
  }
  
  public double getCenterX() {
    return myCenterX;
  }

  public double getCenterY() {
    return myCenterY;
  }
}
