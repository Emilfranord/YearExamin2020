class Mouse {
  int x;
  int y;
  int theta; // angle in radians.
  boolean isFacingLeft; 
  int speed; 


  Mouse() {
    this.speed = 10;
    this.x = 500;
    this.y = 500;
  }

  Mouse(int x, int y) {
    // implement specific location of mouse
    this();
    place(x, y);
  }

  void place(int x, int y) {
  }

  void render() {
    // implement
  }

  void setAngle() { // rotates the mouse, but rotate is a keyword
    // implement
  }

  void advance(Cheese target) {
    // implement
  }

  void advance(Cheese[] targets) {
    // this should call the single cheese variant 
    // implement
  }

  void eat() {
    // implement
    // i dont know what this is going to do. Draw a mouth perhaps.
    // this should call eat on the cheese object
  }
}
