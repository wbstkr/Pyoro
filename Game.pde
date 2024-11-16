public class Game {
  public ArrayList<GameObject> trash;
  public ArrayList<Sprout> sprouts;
  public ArrayList<Tile> tiles;
  public Player player;

  public static final float SIZE = 30;

  public Game() {
    this.trash = new ArrayList<>();
    this.sprouts = new ArrayList<>();
    this.tiles = new ArrayList<>();
    this.player = new Player(Game.SIZE, (width - Game.SIZE) / 2.0, height - (Game.SIZE * 2.0));

    for (int i = 0; i < (int) (width / Game.SIZE); i++) {
      this.tiles.add(new Tile(Game.SIZE, i * Game.SIZE, height - Game.SIZE));
    }
  }

  public int difficultyCalculator(int frame) {
    return (int) (Math.pow(5d, (frame / - 100d) + 3d) + 20d);
  }

  public void updatePlayer() {
    this.player.update();
  }

  public void updateSprouts() {
    if (frameCount % 120 == 0) {
      this.sprouts.add(new Sprout(Game.SIZE, (floor(random(width / Game.SIZE)) * Game.SIZE) + (Game.SIZE / 2.0), Game.SIZE / -2.0));
    }
    this.sprouts.forEach(sprout -> sprout.update(this.tiles, this.trash));
  }

  public void updateTiles() {
    this.tiles.forEach(Tile :: update);
  }

  public void updateTrash() {
    this.trash.forEach(object -> {
      if (this.sprouts.contains(object))
      this.sprouts.remove(object);
    }
    );
    this.trash.clear();
  }

  public void render() {
    this.tiles.forEach(Tile :: render);
    this.player.render();
    this.sprouts.forEach(Sprout :: render);
  }

  public void run() {
    updatePlayer();
    updateSprouts();
    updateTiles();
    updateTrash();
    render();
  }
}
