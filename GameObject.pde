public abstract class GameObject {
  public float size;
  public PVector position;

  public GameObject(float size, float x, float y) {
    this.size = size;
    this.position = new PVector(x, y);
  }

  public void update() {
  }
  public void render() {
  }
}
