class Star //note that this class does NOT extend Floater
{
  int myColor;
  int size;
  int myX, myY;
  public Star(int x, int y) {
    myColor = color(255, 255, 255);
    size = 10;
    myX = x;
    myY = y;
  }
  public void show() {
    fill(myColor);
    ellipse(myX, myY, size, size);
  }
}
