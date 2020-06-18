Cheese[] Cheeses = new Cheese[16];
Mouse frodo = new Mouse();

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
    q.render();
  }

  frodo.render();
  frodo.advance(Cheeses);
}

void mousePressed() {
  if (hasAvailableCheese(Cheeses)) {
    nextAvailableCheese(Cheeses).place(mouseX, mouseY);
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
