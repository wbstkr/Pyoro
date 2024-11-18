public class Tile extends GameObject {
  public boolean destroyed;

  public Tile(float size, float x, float y) {
    super(size, x, y);
    this.destroyed = false;
  }

  public void destroy() {
    this.destroyed = true;
  }

  public void update() {
  }

  public void render() {
    if (!this.destroyed) {
      strokeWeight(2);
      fill(255);
      stroke(125);
      square(this.position.x, this.position.y, this.size);
    }
  }
}