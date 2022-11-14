package wbstkr;

import processing.core.PApplet;

public class Tile {
    private PApplet parent;
    private int timer;
    private float size;
    private int column;
    private float y;
    private boolean destroyed;

    public Tile(PApplet parent, float size, int column, float y) {
        this.parent = parent;
        this.timer = 0;
        this.size = size;
        this.column = column;
        this.y = y;
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
            this.parent.fill(0xFFFFFFFF);
            this.parent.noStroke();
            this.parent.square(PApplet.map(this.column, 0, (int) (this.parent.width / this.size), 0, this.parent.width),
                    this.y, this.size);
        }
    }
}