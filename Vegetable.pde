public class Vegetable extends GameObject {
    private float size;
    private float radius;
    private PVector position;
    
    public Vegetable(float size) {
        this.size = size;
        this.radius = this.size / 2;
        this.position = new PVector(random(this.radius, width - this.radius), this.radius * - 1);
    }
    
    public void update(ArrayList<Tile> tiles, ArrayList<GameObject> trash) {
        this.position.add(0, 5);
        
        if (this.position.y > height + this.radius) {
            trash.add(this);
        } else {
            for (Tile tile : tiles) {
                if (!tile.isDestroyed() && tile.getColumn() == (int) (map(this.position.x, 0, width, 0, width / this.size)) && this.position.y > (tile.getY() - this.radius) && this.position.y < (tile.getY() + tile.getSize() + this.radius)) {
                    tile.destroy();
                    trash.add(this);
                    break;
                }
            }
        }
    }
    
    @Override
    public void render() {
        fill(0xFFFFFFFF);
        noStroke();
        circle(this.position.x, this.position.y, this.size);
    }
}