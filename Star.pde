public class Star //note that this class does NOT extend Floater
{
  private int myColor;
  private int size;
  private int myX, myY;
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
