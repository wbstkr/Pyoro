public Game game;

public void setup() {
  size(600, 400);
  game = new Game();
  frameRate(60);
}

public void draw() {
  background(0);
  game.run();
}
