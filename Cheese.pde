class Cheese {
  int x;
  int y;
  boolean isActive; // The cheese is displayed and the mouse can find it.
  int remaining; // the amount of cheese remaining

  Cheese() {
    this.isActive = false;
    remaining = 8;
  }

  Cheese(int x, int y) {
    this();
    place(x, y);
  }

  void render() {
    if (this.isActive == true) {
      fill(#FFFF00);
      arc(x, y, 40, 40, 0, (TAU/8)*remaining, PIE );
    }
  }

  void eat() {
    remaining--;
    if (remaining <0) {
      remaining = 8;
      isActive = false;
    }
  }

  void place(int x, int y) {
    this.x = x;
    this.y = y;
    this.remaining = 8;
    this.isActive = true;
  }
}
