public class Vegetable {
    private int column;
    private float y;
    private final float SIZE = 30;
    
    public Vegetable() {
        this.column = int(random(width / this.SIZE));
        this.y = this.SIZE / 2;
    }
    
    public void update(ArrayList<Vegetable> vegetables, ArrayList trash) {
        if(this.y < height - (this.SIZE * 1.5)) {
            this.y += 5;
        } else {
            trash.add(this);
        }
    }
    
    public void render() {
        fill(0xFFFFFFFF);
        noStroke();
        circle(map(this.column, 0, int(width / this.SIZE), 0, width) + (this.SIZE / 2), this.y, this.SIZE);
    }
}