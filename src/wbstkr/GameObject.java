package wbstkr;

import processing.core.PApplet;

public abstract class GameObject {
    protected PApplet parent;

    protected GameObject(PApplet parent) {
        this.parent = parent;
    }

    public void update() {
    }

    public void render() {
    }
}
