public class Tile {
    private int column;
    private boolean destroyed;
    private final float SIZE = 30;

    public Tile(int column) {
        this.column = column;
        this.destroyed = false;
    }

    public int getColumn() {
        return this.column;
    }

    public boolean getDestroyed() {
        return this.destroyed;
    }

    public void setDestroy(boolean state) {
        this.destroyed = state;
    }

    public void render() {
        if(!this.destroyed) {
            fill(0xFFFFFFFF);
            noStroke();
            square(map(this.column, 0, int(width / this.SIZE), 0, width), height - this.SIZE, this.SIZE);
        }
    }
}