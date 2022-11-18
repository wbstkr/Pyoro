public class Game {
    private ArrayList<GameObject> trash;
    private ArrayList<Vegetable> vegetables;
    private ArrayList<Tile> tiles;
    private static final float SIZE = 30;

    public Game() {
        this.trash = new ArrayList<>();
        this.vegetables = new ArrayList<>();
        this.tiles = new ArrayList<>();
        for (int i = 0; i < (int) (width / Game.SIZE); i++) {
            this.tiles.add(new Tile(Game.SIZE, i, height - Game.SIZE));
        }
    }

    private int difficultyCalculator(int frame) {
        return (int) (Math.pow(5d, (frame / -100d) + 3d) + 20d);
    }

    private void updateVegetables() {
        if (frameCount % difficultyCalculator(frameCount / 60) == 0) {
            this.vegetables.add(new Vegetable(Game.SIZE));
        }
        this.vegetables.forEach(vegetable -> vegetable.update(this.tiles, this.trash));
    }

    private void updateTiles() {
        this.tiles.forEach(Tile::update);
    }

    private void updateTrash() {
        this.trash.forEach(object -> {
            if (this.vegetables.contains(object))
                this.vegetables.remove(object);
        });
        this.trash.clear();
    }

    private void render() {
        this.vegetables.forEach(Vegetable::render);
        this.tiles.forEach(Tile::render);
    }

    public void run() {
        updateVegetables();
        updateTiles();
        updateTrash();
        render();
    }
}