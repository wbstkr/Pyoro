public class Tile extends GameObject {
    private float size;
    private int column;
    private float y;
    private int timer;
    private boolean destroyed;
    
    public Tile(float size, int column, float y) {
        this.size = size;
        this.column = column;
        this.y = y;
        this.timer = 0;
        this.destroyed = false;
    }
    
    public float getSize() {
        return size;
    }
    
    public int getColumn() {
        return column;
    }
    
    public float getY() {
        return y;
    }
    
    public boolean isDestroyed() {
        return destroyed;
    }
    
    public void destroy() {
        this.destroyed = true;
        this.timer = 600;
    }
    
    @Override
    public void update() {
        if (this.timer < 0) {
            this.destroyed = false;
        } else {
            this.timer--;
        }
    }
    
    @Override
    public void render() {
        if (!this.destroyed) {
            fill(0xFFFFFFFF);
            noStroke();
            square(map(this.column, 0,(int)(width / this.size), 0, width), this.y, this.size);
        }
    }
}