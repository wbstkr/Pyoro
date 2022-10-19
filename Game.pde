public class Game {
    public ArrayList<Vegetable> vegetables;
    public ArrayList<Tile> tiles;
    public ArrayList trash;
    public final float SIZE = 30;
    
    public Game() {
        this.vegetables = new ArrayList();
        this.tiles = new ArrayList();
        setupTiles();
        this.trash = new ArrayList();
    }
    
    public void setupTiles() {
        for (int i = 0; i < int(width / this.SIZE); i++) {
            this.tiles.add(new Tile(this.SIZE, i, int(random(height / this.SIZE - 4, height / this.SIZE - 1)) * this.SIZE));
            this.tiles.add(new Tile(this.SIZE, i, int(random(height / this.SIZE - 4, height / this.SIZE - 1)) * this.SIZE));
        }
    }
    
    public void run() {
        updateVegetables();
        updateTiles();
        updateTrash();
        render();
    }
    
    public void updateVegetables() {
        if (frameCount % 20 == 0) {
            this.vegetables.add(new Vegetable(this.SIZE));
        }
        for (Vegetable vegetable : this.vegetables) {
            vegetable.update(this.tiles, this.trash);
        }
    }
    
    public void updateTiles() {
        for (Tile tile : this.tiles) {
            tile.update();
        }
    }
    
    public void updateTrash() {
        for (Object object : this.trash) {
            if (this.vegetables.contains(object)) this.vegetables.remove(object);
        }
        this.trash.clear();
    }
    
    public void render() {
        for (Vegetable vegetable : this.vegetables) {
            vegetable.render();
        }
        for (Tile tile : this.tiles) {
            tile.render();
        }
    }
}