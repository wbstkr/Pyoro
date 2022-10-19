public class Tile {
    public float size;
    public int column;
    public float y;
    public boolean destroyed;
    public int timer;
    
    public Tile(float size, int column, float y) {
        this.size = size;
        this.column = column;
        this.y = y;
        this.destroyed = false;
        this.timer = 0;
    }

    public void destroy() {
        this.destroyed = true;
        this.timer = 120;
    }

    public void update() {
        if (this.timer < 0) {
            this.destroyed = false;
        } else {
            this.timer--;
        }
    }
    
    public void render() {
        if (!this.destroyed) {
            fill(0xFFFFFFFF);
            noStroke();
            square(map(this.column, 0, int(width / this.size), 0, width), this.y, this.size);
        }
    }
}