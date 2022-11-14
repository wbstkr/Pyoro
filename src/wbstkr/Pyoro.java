package wbstkr;

import processing.core.PApplet;

public class Pyoro extends PApplet {
    private Game game;

    @Override
    public void settings() {
        size(600, 400);
    }

    @Override
    public void setup() {
        game = new Game(this);

        frameRate(60);
    }

    @Override
    public void draw() {
        background(0);

        game.run();
    }

    public static void main(String[] args) {
        String[] appletArgs = new String[] { "MySketch" };
        Pyoro sketch = new Pyoro();
        PApplet.runSketch(appletArgs, sketch);
    }
}