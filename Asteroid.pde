class Asteroid extends Floater {

  private double rotSpeed;

  Asteroid() {

    rotSpeed = Math.random() * 4 - 2;

    corners = (int)(Math.random()*4 + 6);  

    xCorners = new int[corners];
    yCorners = new int[corners];

    float radius = (float)(Math.random()*30 + 20);  

    for (int i = 0; i < corners; i++) {
      double angle = Math.toRadians(360.0 / corners * i);

      double wobble = 0.6 + Math.random() * 0.8;  

      xCorners[i] = (int)(radius * wobble * Math.cos(angle));
      yCorners[i] = (int)(radius * wobble * Math.sin(angle));
    }

    int grey = (int)(Math.random()*100 + 100);
    myColor = color(grey);

    myCenterX = Math.random() * width;
    myCenterY = Math.random() * height;

    myXspeed = Math.random() * 2 - 1;
    myYspeed = Math.random() * 2 - 1;

    myPointDirection = Math.random() * 360;
  }

  @Override
  public void move() {
    super.move();
    turn(rotSpeed);
  }

  public double getCenterX() {
    return myCenterX;
  }

  public double getCenterY() {
    return myCenterY;
  }
}
