package wbstkr;

import processing.core.PApplet;

public class Tile extends GameObject {
    private float size;
    private int column;
    private float y;
    private int timer;
    private boolean destroyed;

    public Tile(PApplet parent, float size, int column, float y) {
        super(parent);
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
        this.timer = 120;
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
            this.parent.fill(0xFFFFFFFF);
            this.parent.noStroke();
            this.parent.square(PApplet.map(this.column, 0, (int) (this.parent.width / this.size), 0, this.parent.width),
                    this.y, this.size);
        }
    }
}