public Game game;
public HashMap<Object, Integer> controller;

public void setup() {
  size(600, 400);
  this.game = new Game();
  this.controller = new HashMap<>();
  frameRate(60);
}

public void draw() {
  background(0);
  game.run();
}

public void keyPressed() {
  if (key == CODED) {
    this.controller.put(keyCode, 0);
  }
}