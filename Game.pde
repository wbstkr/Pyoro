public class Game {
    private ArrayList<Vegetable> vegetables;
    private ArrayList<Tile> tiles;
    private ArrayList trash;
    private final float SIZE = 30;
    
    public Game() {
        this.vegetables = new ArrayList();
        this.tiles = new ArrayList();
        setupTiles();
        this.trash = new ArrayList();
    }
    
    public void setupTiles() {
        for (int i = 0; i < int(width / this.SIZE); i++) {
            this.tiles.add(new Tile(i));
        }
    }
    
    public void run() {
        updateVegetables();
        updateTrash();
        render();
    }
    
    public void updateVegetables() {
        if (frameCount % 6 == 0) {
            this.vegetables.add(new Vegetable());
        }
        for (Vegetable vegetable : this.vegetables) {
            vegetable.update(this.vegetables, this.tiles, this.trash);
        }
    }
    
    public void updateTrash() {
        for (Object object : this.trash) {
            if (this.vegetables.contains(object)) this.vegetables.remove(object);
        }
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