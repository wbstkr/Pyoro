package wbstkr;

import java.util.ArrayList;

import processing.core.PApplet;

public class Game {
    private PApplet parent;
    private ArrayList<GameObject> trash;
    private ArrayList<Vegetable> vegetables;
    private ArrayList<Tile> tiles;
    private static final float SIZE = 30;

    public Game(PApplet parent) {
        this.parent = parent;
        this.trash = new ArrayList<>();
        this.vegetables = new ArrayList<>();
        this.tiles = new ArrayList<>();
        for (int i = 0; i < (int) (this.parent.width / Game.SIZE); i++) {
            this.tiles.add(new Tile(parent, Game.SIZE, i, this.parent.height - Game.SIZE));
        }
    }

    private int difficultyCalculator(int frame) { // TODO: print out value to test if this is accurate
        return (int) (Math.pow(5, (frame / -100) + 3) + 20);
    }

    public void updateVegetables() {
        if (this.parent.frameCount % difficultyCalculator(this.parent.frameCount / 60) == 0) {
            this.vegetables.add(new Vegetable(parent, Game.SIZE));
        }
        this.vegetables.forEach(vegetable -> vegetable.update(this.tiles, this.trash));
    }

    public void updateTrash() {
        for (Object object : this.trash) {
            if (this.vegetables.contains(object))
                this.vegetables.remove(object);
        }
        this.trash.clear();
    }

    public void render() {
        this.vegetables.forEach(Vegetable::render);
        this.tiles.forEach(Tile::render);
    }

    public void run() {
        updateVegetables();
        this.tiles.forEach(Tile::update);
        updateTrash();
        render();
    }

}