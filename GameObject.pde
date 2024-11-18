public abstract class GameObject {
  public PVector position;
  public float size;
  public float radius;

  public GameObject(float size, float x, float y) {
    this.position = new PVector(x, y);
    this.size = size;
    this.radius = this.size / 2.0;
  }

  public void update() {
  }
  public void render() {
  }
}
