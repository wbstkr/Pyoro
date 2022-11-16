package wbstkr;

import java.util.List;

import processing.core.PApplet;

public class Vegetable extends GameObject {
    private float size;
    private float radius;
    private int column;
    private float y;

    public Vegetable(PApplet parent, float size) {
        super(parent);
        this.size = size;
        this.radius = this.size / 2;
        this.column = (int) (this.parent.random(this.parent.width / this.size));
        this.y = this.radius * -1;
    }

    public void update(List<Tile> tiles, List<GameObject> trash) {
        this.y += 5;

        if (this.y > this.parent.height + this.radius) {
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
        this.parent.fill(0xFFFFFFFF);
        this.parent.noStroke();
        this.parent.circle(
                PApplet.map(this.column, 0, (int) (this.parent.width / this.size), 0, this.parent.width)
                        + this.radius,
                this.y,
                this.size);
    }
}