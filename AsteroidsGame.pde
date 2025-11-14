//your variable declarations here
Spaceship ship;
Star[] myStars;
int screenSize = 1000;
public void setup()
{
  size(1000, 1000);
  ship = new Spaceship(screenSize/2, screenSize/2);
  myStars = new Star[200];
  for (int i = 0; i < myStars.length; i++) {
    myStars[i] = new Star((int)(Math.random()*screenSize), (int)(Math.random()*screenSize));
  }
}
public void draw()
{
  background(0, 0, 0);
  for (int i = 0; i < myStars.length; i++) {
    myStars[i].show();
  }
  ship.show();
  ship.move();
}

public void keyPressed()
{
  if (key == 'r') {
    ship.hyperspace((int)(Math.random()*screenSize), (int)(Math.random()*screenSize));
  }
  if (key == 'w') {
    ship.accelerate(1);
  }
  if (key == 'd') {
    ship.turnLeft();
  }
  if (key == 'a') {
    ship.turnRight();
  }
}
