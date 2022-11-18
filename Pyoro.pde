/*
* TODO:
* - vegetable are actually called beans
* - tiles only respawn when a white bean is eaten
* - - white beans do nearest tile
* - - shiny beans do 10 nearest tiles
* - beans get faster and spawn more frequently over time
* - destroyed tiles limit mobility (you cannot fall into the pits)
* - the higher you eat a bean, the more points its worth (usually 10, 50, 100, 300)
* - player cannot jump
*/

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