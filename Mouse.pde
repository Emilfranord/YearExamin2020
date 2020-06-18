class Mouse {
  int x;
  int y;
  float theta; // angle in radians.
  int speed; 
  int eatingDistance;

  Mouse(int x, int y, int speed) {
    place(x, y);
    this.speed = speed;
    this.eatingDistance = 50;
  }

  Mouse(int x, int y) {
    this(x, y, 10);
  }

  Mouse() {
    this(500, 500);
  }

  void place(int x, int y) {
    this.x = x;
    this.y = y;
  }

  void move(int plusX, int plusY) {
    this.x += plusX;
    this.y += plusY;
  }

  void render() {
    push();
    translate(x, y);
    rotate(theta);

    stroke(#e08b3e);
    strokeWeight(4);
    line(0, 0, -100, 0);
    noStroke();

    fill(#8B4513);
    ellipse(0, 0, 100, 60);

    fill(#A0522D);
    ellipse(-10, 0, 60, 35);

    fill(0);
    circle(34, 10, 5);
    circle(34, -10, 5);

    pop();
  }

  void setAngle(float angle) {
    this.theta = angle;
  }

  void advance(Cheese target) {
    if (target.isActive == true && distance(target) > 40) {
      PVector path = new PVector(target.x-this.x, target.y-this.y);
      path.normalize();
      this.move(speed * round(path.x), speed * round(path.y));
      this.setAngle(path.heading());
    }
  }

  void advance(Cheese[] targets) {
    if (hasValidTarget(targets)) {
      advance(targets[closestCheese(targets)]);
      // finds the index of the closest cheese in the array. finds that object and passes it to advance single target.
    }
  }

  boolean hasValidTarget(Cheese[] targets) {
    for (Cheese q : targets ) {
      if (q.isActive == true) {
        return true;
      }
    }
    return false;
  }

  int closestCheese(Cheese[] targets) { // finds the closest and active cheeese. 
    float closestValue = 5000;  // just a big number
    int indexClosest = targets.length+1;

    for (int i = 0; i<targets.length; i++) {
      if (distance(targets[i]) < closestValue && targets[i].isActive == true) {
        closestValue = distance(targets[i]);
        indexClosest = i;
      }
    }
    return indexClosest;
  }

  void eat(Cheese target) {
    if (distance(target) <eatingDistance && target.isActive == true) {
      target.eat(this);
    }
  }

  float distance(Cheese target) {
    return dist(target.x, target.y, this.x, this.y);
  }
}
