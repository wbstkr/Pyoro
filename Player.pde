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

  public void tongueLogic() {
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
  }

  public void movementLogic(ArrayList<Tile> tiles) {
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
  }

  public void update(ArrayList<Sprout> sprouts, ArrayList<Tile> tiles, ArrayList<GameObject> trash, ArrayList<Tile> replenishQueue) {
    this.tongueLogic();
    this.movementLogic(tiles);

    for (Sprout sprout : sprouts) {
      if (numBetween(sprout.position.x, this.position.x, this.size)) {
        if (sprout.position.y > this.position.y) {
          trash.add(sprout);
          this.hurt = 120;
        }
      }
      if (this.tongue > 0 && !this.retracting) {
        if (this.getTonguePosition().dist(sprout.position) < sprout.size) {
          if (sprout.type == SproutTypes.WHITE) {
            Tile nearestDestroyedTile = null;
            float closestDistance = width;
            for (Tile tile : tiles) {
              if (tile.destroyed && !replenishQueue.contains(tile)) {
                if (abs(this.position.x - tile.position.x) < closestDistance) {
                  nearestDestroyedTile = tile;
                }
              }
            }
            if (nearestDestroyedTile != null) {
              replenishQueue.add(nearestDestroyedTile);
            }
          } else if (sprout.type == SproutTypes.RAINBOW) {
            for (int i = 0; i < 10; i++) {
              Tile nearestDestroyedTile = null;
              float closestDistance = width;
              for (Tile tile : tiles) {
                if (tile.destroyed && !replenishQueue.contains(tile)) {
                  if (abs(this.position.x - tile.position.x) < closestDistance) {
                    nearestDestroyedTile = tile;
                  }
                }
              }
              if (nearestDestroyedTile != null) {
                replenishQueue.add(nearestDestroyedTile);
              }
            }
          }
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
