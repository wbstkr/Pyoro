public class Vegetable {
    public float size;
    public float radius;
    public int column;
    public float y;
    
    public Vegetable(float size) {
        this.size = size;
        this.radius = this.size / 2;
        this.column = int(random(width / this.size));
        this.y = this.radius * -1;
    }
    
    public void update(ArrayList<Tile> tiles, ArrayList trash) {
        this.y += 5;
        
        if (this.y > height + this.radius) {
            trash.add(this);
        } else {
            for (Tile tile : tiles) {
                if (!tile.destroyed) {
                    if (tile.column == this.column && (this.y > tile.y - this.radius && this.y < tile.y + tile.size + this.radius)) {
                        tile.destroy();
                        trash.add(this);
                        break;
                    }
                }
            }
        }
    }
    
    public void render() {
        fill(0xFFFFFFFF);
        noStroke();
        circle(map(this.column, 0, int(width / this.size), 0, width) + this.radius, this.y, this.size);
    }
}