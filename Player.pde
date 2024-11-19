public enum PlayerControls {
  LEFT, RIGHT, JUMP, TONGUE;
}

public class Player extends GameObject {
  public float tongue;
  public boolean facingRight;
  public boolean retracting;
  public int hurt;

  public HashMap<PlayerControls, Object[]> playerControls; // TODO: better controls

  public Player(float size, float x, float y) {
    super(size, x, y);
    this.tongue = 0;
    this.facingRight = true;
    this.retracting = false;
    this.hurt = 0;
  }

  public Tile tileAt(ArrayList<Tile> tiles, float x, float y) {
    for (Tile tile : tiles) {
      boolean intersectX = numBetween(x, tile.position.x, tile.size);
      boolean intersectY = numBetween(y, tile.position.y, tile.size);
      if (intersectX && intersectY) {
        return tile;
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

  public void update(ArrayList<Sprout> sprouts, ArrayList<Tile> tiles, ArrayList<GameObject> trash, ArrayList<Tile> replenishQueue) {
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
        float checkX = this.position.x - 1;
        float checkY = this.position.y + this.size + 1;
        Tile tile = this.tileAt(tiles, checkX, checkY);
        if (tile != null) {
          if (!tile.destroyed) {
            this.position.x -= 5;
          }
        }
      }
      if (getInput(RIGHT, 'd') > -1) {
        this.facingRight = true;
        float checkX = this.position.x + this.size + 1;
        float checkY = this.position.y + this.size + 1;
        Tile tile = this.tileAt(tiles, checkX, checkY);
        if (tile != null) {
          if (!tile.destroyed) {
            this.position.x += 5;
          }
        }
      }
    }

    for (Sprout sprout : sprouts) {
      if (numBetween(sprout.position.x, this.position.x, this.size)) {
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
    line(this.position.x + this.radius, this.position.y + this.radius, tonguePosition.x, tonguePosition.y);
  }
}
