
class Bullet extends Floater
{
  public int size;
  public Bullet(Spaceship theShip) {
    myCenterX = theShip.getCenterX();
    myCenterY = theShip.getCenterY();
    myXspeed = 0;//theShip.getXspeed();
    myYspeed = 0;//theShip.getYspeed();
    myPointDirection = theShip.getPointDirection();
    accelerate(8.0);
    size = 10;
  }
  
  public void show ()  //Draws the floater at the current position
  {
    fill(255,100,100);
    ellipse((float)myCenterX, (float)myCenterY, size, size);
  }
  
  public double getCenterX() {
    return myCenterX;
  }

  public double getCenterY() {
    return myCenterY;
  }
  
  public int getSize() {
    return size;
  }
  
  public void move ()   //move the floater in the current direction of travel
  {
    //change the x and y coordinates by myXspeed and myYspeed
    myCenterX += myXspeed;
    myCenterY += myYspeed;
  }
}
