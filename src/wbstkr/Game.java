package wbstkr;

import java.util.ArrayList;

import processing.core.PApplet;

public class Game {
    private PApplet parent;
    private ArrayList<Vegetable> vegetables;
    private ArrayList<Tile> tiles;
    private ArrayList<Object> trash;
    private static final float SIZE = 30;

    public Game(PApplet parent) {
        this.parent = parent;
        this.vegetables = new ArrayList<>();
        this.tiles = new ArrayList<>();
        setupTiles();
        this.trash = new ArrayList<>();
    }

    public void setupTiles() {
        for (int i = 0; i < (int) (this.parent.width / Game.SIZE); i++) {
            this.tiles.add(new Tile(parent, Game.SIZE, i,
                    (int) (this.parent.random(this.parent.height / Game.SIZE - 4, this.parent.height / Game.SIZE - 1))
                            * Game.SIZE));
            this.tiles.add(new Tile(parent, Game.SIZE, i,
                    (int) (this.parent.random(this.parent.height / Game.SIZE - 4, this.parent.height / Game.SIZE - 1))
                            * Game.SIZE));
        }
    }

    public void updateVegetables() {
        if (this.parent.frameCount % 20 == 0) {
            this.vegetables.add(new Vegetable(parent, Game.SIZE));
        }
        for (Vegetable vegetable : this.vegetables) {
            vegetable.update(this.tiles, this.trash);
        }
    }

    public void updateTiles() {
        for (Tile tile : this.tiles) {
            tile.update();
        }
    }

    public void updateTrash() {
        for (Object object : this.trash) {
            if (this.vegetables.contains(object))
                this.vegetables.remove(object);
        }
        this.trash.clear();
    }

    public void render() {
        for (Vegetable vegetable : this.vegetables) {
            vegetable.render();
        }
        for (Tile tile : this.tiles) {
            tile.render();
        }
    }

    public void run() {
        updateVegetables();
        updateTiles();
        updateTrash();
        render();
    }

}