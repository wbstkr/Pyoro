public Game game;

public void setup() {
  size(600, 400);
  this.game = new Game();
  this.controller = new HashMap<>();
  frameRate(60);
}

public void draw() {
  background(0);
  updateController();
  game.run();
}

public boolean numBetween(float num, float begin, float range) {
  float difference = num - begin;
  return difference >= 0 && difference <= range;
}

public HashMap<Object, Integer> controller;

public void keyPressed() {
  Object keyInput;
  if (key == CODED) {
    keyInput = keyCode;
  } else {
    keyInput = key;
  }
  if (this.controller.getOrDefault(keyInput, -1) == -1) {
    this.controller.put(keyInput, 0);
  }
}

public void keyReleased() {
  Object keyInput;
  if (key == CODED) {
    keyInput = keyCode;
  } else {
    keyInput = key;
  }
  if (this.controller.getOrDefault(keyInput, -1) != -1) {
    this.controller.put(keyInput, -1);
  }
}

public void updateController() {
  for (Object keyInput : this.controller.keySet()) {
    if (this.controller.get(keyInput) != -1) {
      this.controller.put(keyInput, this.controller.get(keyInput) + 1);
    }
  }
}

public int getInput(Object... keyInputs) {
  int output = -1;
  for (Object keyInput : keyInputs) {
    output = max(output, this.controller.getOrDefault(keyInput, -1));
  }
  return output;
}