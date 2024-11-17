public class Player extends GameObject {
  public float tongue;
  public boolean facingRight;
  public boolean retracting;
  public int hurt;

  public Player(float size, float x, float y) {
    super(size, x, y);
    this.tongue = 0;
    this.facingRight = true;
    this.retracting = false;
    this.hurt = 0;
  }

  public boolean xPositionInColumn(float x) {
    return x > this.position.x && x < this.position.x + this.size;
  }

  public Tile tileAt(ArrayList<Tile> tiles, float x, float y) {
    for (Tile tile : tiles) {
      if (tile.xPositionInColumn(x)) {
        if ( y >= tile.position.y && y <= tile.position.y + tile.size) {
          return tile;
        }
      }
    }
    return null;
  }

  public PVector getTonguePosition() {
    if (this.facingRight) {
      return PVector.add(this.position, new PVector(this.tongue + (this.size), -this.tongue));
    } else {
      return PVector.sub(this.position, new PVector(this.tongue, this.tongue));
    }
  }

  public void update(ArrayList<Sprout> sprouts, ArrayList<Tile> tiles, ArrayList<GameObject> trash) {
    int maxTongueSize;
    if (this.facingRight) {
      maxTongueSize = int(min(width - (this.position.x + this.size), this.position.y));
    } else {
      maxTongueSize = int(min(this.position.x, this.position.y));
    }
    if (getInput(' ', 'z', 'k') > -1 && !this.retracting && this.tongue < maxTongueSize) {
      this.tongue += 10;
    } else {
      this.retracting = true;
      this.tongue = max(this.tongue - 20, 0);
    }

    if (this.tongue == 0) {
      this.retracting = false;
      if (getInput(LEFT, 'a') > -1) {
        this.facingRight = false;
        Tile tile = this.tileAt(tiles, this.position.x - 1, this.position.y + this.size + 1);
        if (tile != null) {
          if (!tile.destroyed) {
            this.position.x -= 5;
          }
        }
      }
      if (getInput(RIGHT, 'd') > -1) {
        this.facingRight = true;
        Tile tile = this.tileAt(tiles, this.position.x + this.size + 1, this.position.y + this.size + 1);
        if (tile != null) {
          if (!tile.destroyed) {
            this.position.x += 5;
          }
        }
      }
    }

    for (Sprout sprout : sprouts) {
      if (this.xPositionInColumn(sprout.position.x)) {
        if (sprout.position.y > this.position.y) {
          trash.add(sprout);
          this.hurt = 120;
        }
      }
      if (this.tongue > 0 && !this.retracting) {
        if (this.getTonguePosition().dist(sprout.position) < sprout.size) {
          trash.add(sprout);
          this.retracting = true;
        }
      }
    }
    if (this.hurt > 0) {
      hurt--;
    }
  }

  public void render() {
    strokeWeight(2);
    stroke(125);
    if (this.hurt > 0) {
      fill(255, 0, 0);
    } else {
      fill(255);
    }
    square(this.position.x, this.position.y, this.size);

    PVector tonguePosition = this.getTonguePosition();
    strokeWeight(4);
    stroke(125);
    line(this.position.x + (this.size / 2.0), this.position.y + (this.size / 2.0), tonguePosition.x, tonguePosition.y);
  }
}
