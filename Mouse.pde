class Mouse {
  int x;
  int y;
  int theta; // angle in radians.
  boolean isFacingLeft; 
  int speed; 
  int eatingDistance = 60;


  Mouse() {
    this.speed = 10;
    this.x = 500;
    this.y = 500;
  }

  Mouse(int x, int y) {
    this();
    place(x, y);
  }

  void place(int x, int y) { // effectively a setter
    this.x = x;
    this.y = y;
  }

  void move(int plusX, int plusY) {
    this.x = x+ plusX;
    this.y = y+ plusY;
  }

  void render() {
    // TODO: make a more detailed version 
    // TODO: make a vertion that use theta
    fill(#8B4513);
    circle(x, y, 60);
  }

  void setAngle(int angle) { // rotates the mouse, but rotate is a keyword
    this.theta = angle;
    if (this.theta > TAU/4 && this.theta < (3*TAU)/4) {
      isFacingLeft = true;
    } else {
      isFacingLeft = false;
    }
  }

  void advance(Cheese target) {
    if(target.isActive == true){
    PVector path = new PVector(target.x-this.x, target.y-this.y);
    path.normalize();
    this.move(speed * round(path.x), speed * round(path.y));
    }
  }

  void advance(Cheese[] targets) {
    // this should call the single cheese variant
    // it should go to the closest active cheese.
    // implement
    float closestValue = 5000;
    int indexClosest = 99;
    for (int i = 0; i<targets.length; i++) {
      if (distance(targets[i]) < closestValue) {
        closestValue = distance(targets[i]);
        indexClosest = i;
      }
    }

    advance(targets[indexClosest]);
  }

  void eat(Cheese target) {
    //I dont know what this is going to do. Draw a mouth perhaps.

    if (distance(target) <eatingDistance && target.isActive == true) {
      target.eat();
    }
  }

  float distance(Cheese target) {
    return dist(target.x, target.y, this.x, this.y);
  }
}
