public class Player extends GameObject {
  public Player(float size, float x, float y) {
    super(size, x, y);
  }

  public boolean xPositionInColumn(float x) {
    return x > this.position.x && x < this.position.x + this.size;
  }

  public void update() {
    if (keyPressed) {
      if (key == CODED) {
        switch (keyCode) {
        case LEFT:
          this.position.x -= 1;
          break;
        case RIGHT:
          this.position.x += 1;
          break;
        }
      } else {
        switch (key) {
        case 'a':
          this.position.x -= 1;
          break;
        case 'd':
          this.position.x += 1;
          break;
        }
      }
    }
  }

  public void render() {
    strokeWeight(2);
    fill(255);
    stroke(125);
    square(this.position.x, this.position.y, this.size);
  }
}
