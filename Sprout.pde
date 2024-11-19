public enum SproutTypes {
  GREEN, WHITE, RAINBOW;
}

public class Sprout extends GameObject {
  public SproutTypes type;

  public Sprout(float size, float x, float y) {
    super(size, x, y);

    float typeChance = random(1);
    if (typeChance < 0.1) {
      this.type = SproutTypes.RAINBOW;
    } else if (typeChance < 0.3) {
      this.type = SproutTypes.WHITE;
    } else {
      this.type = SproutTypes.GREEN;
    }
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
      if (numBetween(this.position.x, tile.position.x, tile.size)) {
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
    stroke(125);

    switch(this.type) {
    case RAINBOW:
      color[] colors = {
        color(255, 0, 0),
        color(0, 255, 0),
        color(0, 0, 255)
      };
      fill(colors[(frameCount / 10) % 3]);
      break;
    case WHITE:
      fill(255);
      break;
    default:
      fill(0, 255, 0);
    }

    circle(this.position.x, this.position.y, this.size);
  }
}
