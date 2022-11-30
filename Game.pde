public class Game {
    public ArrayList<GameObject> trash;
    public ArrayList<Bean> beans;
    public ArrayList<Tile> tiles;
    public static final float SIZE = 30;
    
    public Game() {
        this.trash = new ArrayList<>();
        this.beans = new ArrayList<>();
        this.tiles = new ArrayList<>();
        for (int i = 0; i < (int)(width / Game.SIZE); i++) {
            this.tiles.add(new Tile(Game.SIZE, i * Game.SIZE, height - Game.SIZE));
        }
    }
    
    public int difficultyCalculator(int frame) {
        return(int)(Math.pow(5d,(frame / - 100d) + 3d) + 20d);
    }
    
    public void updateBeans() {
        if (frameCount % difficultyCalculator(frameCount / 60) == 0) {
            this.beans.add(new Bean(Game.SIZE, random(Game.SIZE / 2, width - Game.SIZE / 2), Game.SIZE / - 2));
        }
        this.beans.forEach(bean -> bean.update(this.tiles, this.trash));
    }
    
    public void updateTiles() {
        this.tiles.forEach(Tile ::  update);
    }
    
    public void updateTrash() {
        this.trash.forEach(object -> {
            if (this.beans.contains(object))
                this.beans.remove(object);
        });
        this.trash.clear();
    }
    
    public void render() {
        this.beans.forEach(Bean ::  render);
        this.tiles.forEach(Tile ::  render);
    }
    
    public void run() {
        updateBeans();
        updateTiles();
        updateTrash();
        render();
    }
}