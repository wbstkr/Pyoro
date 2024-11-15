public class Bean extends GameObject {
  public float radius;

  public Bean(float size, float x, float y) {
    super(size, x, y);
    this.radius = this.size / 2;
  }

  public void update(ArrayList<Tile> tiles, ArrayList<GameObject> trash) {
    this.position.add(0, 5);

    if (this.position.y > height + this.radius) {
      trash.add(this);
    } else {
      for (Tile tile : tiles) {
        if (!tile.destroyed && this.position.x > tile.position.x && this.position.x < tile.position.x + tile.size) {
          tile.destroy();
          trash.add(this);
          break;
        }
      }
    }
  }

  // TODO: does not render?
  public void render() {
    fill(255);
    noStroke();
    circle(this.position.x, this.position.y, this.size);
  }
}
