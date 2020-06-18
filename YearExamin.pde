Cheese[] Cheeses = new Cheese[16];
Mouse frodo = new Mouse();
Mouse gollom = new Mouse(1000,500);

void setup() {
  fullScreen(1);
  frameRate(15);

  for (int i = 0; i<Cheeses.length; i++) {
    Cheeses[i] = new Cheese();
  }
}

void draw() {
  background(125);
  noStroke();

  for (Cheese q : Cheeses ) {
    frodo.eat(q);
    gollom.eat(q);
    q.render();
  }

  frodo.render();
  gollom.render();
  //frodo.advance(Cheeses);
  gollom.toTarget(Cheeses);
  
}

void mousePressed() {
  if (hasAvailableCheese(Cheeses)) {
    nextAvailableCheese(Cheeses).place(mouseX, mouseY);
    gollom.findNextTarget(Cheeses);
  }
}

Cheese nextAvailableCheese(Cheese[] targets) {
  for (Cheese q : targets) {
    if (q.isActive == false)
      return q;
  }
  return targets[0];
}

boolean hasAvailableCheese(Cheese[] targets) {
  for (Cheese q : targets) {
    if (q.isActive == false) return true;
  }
  return false;
}

// TODO call closestCheese fewer times.
// only call it when there is a reason for it.
