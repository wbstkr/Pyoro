public class Sprout extends GameObject {
  public float radius;

  public Sprout(float size, float x, float y) {
    super(size, x, y);
    this.radius = this.size / 2;
  }

  public void update(ArrayList<Tile> tiles, ArrayList<GameObject> trash) {
    this.position.add(0, 5);

    if (this.position.y > height + this.radius) {
      trash.add(this);
    } else {
      Tile nearestTile = this.getClosestTile(tiles);
      if (nearestTile != null) {
        if (!nearestTile.destroyed && this.position.y > nearestTile.position.y - this.radius) {
          nearestTile.destroy();
          trash.add(this);
        }
      }
    }
  }

  public Tile getClosestTile(ArrayList<Tile> tiles) {
    ArrayList<Tile> tilesInColumn = new ArrayList<>();
    Tile foundTile = null;
    for (Tile tile : tiles) {
      if (tile.xPositionInColumn(this.position.x)) {
        tilesInColumn.add(tile);
      }
    }
    for (Tile tile : tilesInColumn) {
      if (tile.position.y > this.position.y - this.radius) {
        if (foundTile == null) {
          foundTile = tile;
        } else if (tile.position.y < foundTile.position.y) {
          foundTile = tile;
        }
      }
    }
    return foundTile;
  }

  public void render() {
    strokeWeight(2);
    fill(255);
    stroke(125);
    circle(this.position.x, this.position.y, this.size);
  }
}
