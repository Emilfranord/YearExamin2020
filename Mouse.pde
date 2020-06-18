class Mouse {
  int x;
  int y;
  float theta; // angle in radians.
  boolean isFacingLeft; // this might be irrelevant, we will see. 
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
    // TODO: make a version that use theta
    
    push();
    translate(x, y);
    rotate(theta);

    stroke(50);
    strokeWeight(4);
    line(0,0, -100,0);
    noStroke();
    fill(#8B4513);
    circle(0, 0, 60);

    pop();
  }

  void setAngle(float angle) { // rotates the mouse, but rotate is a keyword
    this.theta = angle;
    if (this.theta > TAU/4 && this.theta < (3*TAU)/4) {
      isFacingLeft = true;
    } else {
      isFacingLeft = false;
    }
  }

  void advance(Cheese target) {
    if (target.isActive == true) {
      PVector path = new PVector(target.x-this.x, target.y-this.y);
      path.normalize();
      this.move(speed * round(path.x), speed * round(path.y));
      this.setAngle(PVector.angleBetween(path, new PVector(1,0)));
    }
  }

  void advance(Cheese[] targets) {
    if (hasValidTarget(targets)) {
      advance(targets[closestCheese(targets)]);
    }
  }

  int closestCheese(Cheese[] targets) { // finds the closest and active cheeese. 
    float closestValue = 5000;
    int indexClosest = 99;
    for (int i = 0; i<targets.length; i++) {
      if (distance(targets[i]) < closestValue && targets[i].isActive == true) {
        closestValue = distance(targets[i]);
        indexClosest = i;
      }
    }
    return indexClosest;
  }

  boolean hasValidTarget(Cheese[] targets) {
    for (Cheese q : targets ) {
      if (q.isActive == true) {
        return true;
      }
    }

    return false;
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
