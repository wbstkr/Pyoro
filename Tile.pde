public class Tile extends GameObject {
  public int timer;
  public boolean destroyed;

  public Tile(float size, float x, float y) {
    super(size, x, y);
    this.timer = 0;
    this.destroyed = false;
  }

  public void destroy() {
    this.destroyed = true;
    this.timer = 600;
  }

  public void update() {
    if (this.timer < 0) {
      this.destroyed = false;
    } else {
      this.timer--;
    }
  }

  public void render() {
    if (!this.destroyed) {
      fill(255);
      noStroke();
      square(this.position.x, this.position.y, this.size);
    }
  }
}
