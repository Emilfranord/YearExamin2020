class Cheese {
  int x;
  int y;
  boolean isActive; // The cheese is displayed and the mouse can find it.
  int remaining; // the amount of cheese remaining
  int slice;  

  Cheese() {
    this.isActive = false;
    slice = 16;
    remaining = slice;
  }

  Cheese(int x, int y) {
    this();
    place(x, y);
  }

  void render() {
    if (this.isActive == true) {
      fill(#FFFF00);
      arc(x, y, 40, 40, 0, (TAU/slice)*remaining, PIE );
    }
  }

  void eat() {
    remaining--;
    if (remaining <0) {
      remaining = slice;
      isActive = false;
      gollom.findNextTarget(Cheeses);
    }
  }

  void eat(Mouse eater) {
    this.eat();
  }

  void place(int x, int y) {
    this.x = x;
    this.y = y;
    this.remaining = slice;
    this.isActive = true;
  }
}
