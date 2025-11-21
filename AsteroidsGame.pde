Spaceship ship;
Star[] myStars;
ArrayList<Asteroid> asteroids;
int screenSize = 1000;
public void setup()
{
  size(1000, 1000);
  ship = new Spaceship(screenSize/2, screenSize/2);
  myStars = new Star[200];
  for (int i = 0; i < myStars.length; i++) {
    myStars[i] = new Star((int)(Math.random()*screenSize), (int)(Math.random()*screenSize));
  }
  asteroids = new ArrayList<Asteroid>();      
  for (int i = 0; i < 10; i++) {               
    asteroids.add(new Asteroid());
  }
}
public void draw()
{
  background(0, 0, 0);
  for (int i = 0; i < myStars.length; i++) {
    myStars[i].show();
  }
  
  for (int i = 0; i < asteroids.size(); i++) {
    Asteroid a = asteroids.get(i);
    a.show();
    a.move();
  }
  
  ship.show();
  ship.move();
  
  checkAsteroidCollisions();
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

void checkAsteroidCollisions() {
  for (int i = asteroids.size() - 1; i >= 0; i--) {
    Asteroid a = asteroids.get(i);

    double dx = ship.getCenterX() - a.getCenterX();
    double dy = ship.getCenterY() - a.getCenterY();
    double dist = Math.sqrt(dx*dx + dy*dy);

    if (dist < 25) {
      asteroids.remove(i);  
    }
  }
}
