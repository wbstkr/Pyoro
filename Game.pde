public class Game {
    private ArrayList<Vegetable> vegetables;
    private ArrayList trash;
    
    public Game() {
        this.vegetables = new ArrayList();
        this.trash = new ArrayList();
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
            vegetable.update(this.vegetables, this.trash);
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
    }
}