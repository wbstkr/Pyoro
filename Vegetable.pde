public class Vegetable extends GameObject {
    private float size;
    private float radius;
    private int column;
    private float y;
    
    public Vegetable(float size) {
        this.size = size;
        this.radius = this.size / 2;
        this.column = (int)(random(width / this.size));
        this.y = this.radius * - 1;
    }
    
    public void update(ArrayList<Tile> tiles, ArrayList<GameObject> trash) {
        this.y += 5;
        
        if (this.y > height + this.radius) {
            trash.add(this);
        } else {
            for (Tile tile : tiles) {
                if (!tile.isDestroyed() && tile.getColumn() == this.column
                    && (this.y > tile.getY() - this.radius
                    && this.y < tile.getY() + tile.getSize() + this.radius)) {
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
        circle(map(this.column, 0,(int)(width / this.size), 0, width) + this.radius, this.y, this.size);
    }
}