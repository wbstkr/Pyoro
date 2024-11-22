public class Tile extends GameObject {
  public boolean destroyed;
  public PVector targetPosition;
  public int replenishingTimer;

  public Tile(float size, float x, float y) {
    super(size, x, y);
    this.targetPosition = this.position.copy();
    this.destroyed = false;
    this.replenishingTimer = -1;
  }

  public void destroy() {
    this.destroyed = true;
  }

  public void update() {
  }

  public void render() {
    if (!this.destroyed || this.replenishingTimer > 0) {
      strokeWeight(2);
      fill(255);
      stroke(125);
      square(this.position.x, this.position.y, this.size);
    }
  }
}