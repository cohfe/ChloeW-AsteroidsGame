boolean gameOver = false;
boolean youWin = false;
Spaceship ship;
Star[] myStars;
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<Asteroid> asteroids = new ArrayList<Asteroid>();
int screenSize = 1000;
public void setup()
{
  size(1000, 1000);
  ship = new Spaceship(screenSize/2, screenSize/2);

  myStars = new Star[200];
  for (int i = 0; i < myStars.length; i++) {
    myStars[i] = new Star((int)(Math.random()*screenSize), (int)(Math.random()*screenSize));
  }

  for (int i = 0; i < 10; i++) {
    asteroids.add(new Asteroid());
  }
}
public void draw()
{
  if (gameOver) {
    displayText("GAME OVER");
  } else if (youWin) {
    displayText("YOU WIN");
  } else {
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

    for (int i = 0; i < bullets.size(); i++) {
      Bullet b = bullets.get(i);
      b.show();
      b.move();
    }
  }
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
  if (key == ' ') {
    bullets.add(new Bullet(ship));
  }
}

void checkAsteroidCollisions() {
  for (int i = asteroids.size() - 1; i >= 0; i--) {
    Asteroid a = asteroids.get(i);
    if (bullets.size() != 0) {
      for (int j = bullets.size() - 1; j >= 0; j--) {
        Bullet b = bullets.get(j);

        double dx = b.getCenterX() - a.getCenterX();
        double dy = b.getCenterY() - a.getCenterY();
        double dista = Math.sqrt(dx*dx + dy*dy);

        if (dista < b.getSize()) {
          asteroids.remove(i);
          if (asteroids.size() == 0) {
            youWin = true;
          }
          bullets.remove(j);
          return;
        }
      }
    }
    double dx = ship.getCenterX() - a.getCenterX();
    double dy = ship.getCenterY() - a.getCenterY();
    double dista = Math.sqrt(dx*dx + dy*dy);

    if (dista < 25) {
      asteroids.remove(i);
      gameOver = true;
      break;
    }
  }
}

void displayText(String text) {
  noStroke();
  fill(0, 0, 0);
  ellipse(500, 500, 2000, 2000);
  fill(0, 408, 612);
  textSize(128);
  text(text, 180, 500);
}
