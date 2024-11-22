public class Game {
  public ArrayList<GameObject> trash;
  public ArrayList<Sprout> sprouts;
  public ArrayList<Tile> tiles;
  public ArrayList<Tile> replenishQueue;
  public Player player;

  public static final float SIZE = 30;

  public Game() {
    this.trash = new ArrayList<>();
    this.sprouts = new ArrayList<>();
    this.tiles = new ArrayList<>();
    this.replenishQueue = new ArrayList<>();

    float playerX = (width - Game.SIZE) / 2.0;
    float playerY = height - (Game.SIZE * 2.0);
    this.player = new Player(Game.SIZE, playerX, playerY);

    for (int i = 0; i < (int) (width / Game.SIZE); i++) {
      float tileX = i * Game.SIZE;
      float tileY = height - Game.SIZE;
      this.tiles.add(new Tile(Game.SIZE, tileX, tileY));
    }
  }

  public int difficultyCalculator(int frame) {
    return (int) (Math.pow(5d, (frame / - 100d) + 3d) + 20d);
  }

  public void updatePlayer() {
    this.player.update(this.sprouts, this.tiles, this.trash, this.replenishQueue);
  }

  public void updateSprouts() {
    if (frameCount % 120 == 0) {
      float sproutX = (floor(random(width / Game.SIZE)) * Game.SIZE) + (Game.SIZE / 2.0);
      float sproutY = Game.SIZE / -2.0;
      this.sprouts.add(new Sprout(Game.SIZE, sproutX, sproutY));
    }
    for (Sprout sprout : this.sprouts) {
      sprout.update(this.tiles, this.trash);
    }
  }

  public void updateTiles() {
    for (Tile tile : this.tiles) {
      tile.update();
    }
  }

  public void updateTrash() {
    for (GameObject object : this.trash) {
      if (this.sprouts.contains(object)) {
        this.sprouts.remove(object);
      }
    }
    this.trash.clear();
  }

  public void updateReplenishQueue() {
    ArrayList<Tile> replenishTrash = new ArrayList<>();
    for (int i = 0; i < this.replenishQueue.size(); i++) {
      Tile previousTile = null;
      Tile tile = this.replenishQueue.get(i);
      if (i > 0) {
        previousTile = this.replenishQueue.get(i - 1);
        if (previousTile.replenishingTimer > 10) {
          tile.replenishingTimer++;
        }
      } else {
        tile.replenishingTimer++;
      }
      if (tile.replenishingTimer == 0) {
        tile.position.y = -tile.size;
      }
      if (tile.replenishingTimer > -1) {
        tile.position.y += 10;
      }
      if (tile.position.y > tile.targetPosition.y) {
        tile.position = tile.targetPosition.copy();
        tile.replenishingTimer = -1;
        tile.destroyed = false;
        replenishTrash.add(tile);
      }
    }
    for (Tile tile : replenishTrash) {
      if (!tile.destroyed) {
        this.replenishQueue.remove(tile);
      }
    }
  }

  public void render() {
    for (Tile tile : this.tiles) {
      tile.render();
    }
    for (Sprout sprout : this.sprouts) {
      sprout.render();
    }
    this.player.render();
  }

  public void run() {
    updatePlayer();
    updateSprouts();
    updateTiles();
    updateReplenishQueue();
    updateTrash();
    render();
  }
}
