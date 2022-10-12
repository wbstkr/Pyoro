public Game game;

public void setup() {
    size(600, 400);

    game = new Game();

    frameRate(60);
}

public void draw() {
    background(0);
    
    game.run();

    fill(0xFFFFFFFF);
    textAlign(LEFT, TOP);
    text(join(new String[] {str(frameCount), str(frameRate)}, "\n"), 0, 0);
}