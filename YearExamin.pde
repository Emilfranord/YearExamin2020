Cheese[] Cheeses = new Cheese[10]; // TODO: give array values in setup 
Mouse frodo = new Mouse();


void setup() {
  fullScreen(1); // change to blank
  frameRate(10);

  for (int i = 0; i<Cheeses.length; i++) {
    Cheeses[i] = new Cheese();
  }
}

void draw() {
  background(125);
  noStroke();
  
  frodo.render();
  frodo.advance(Cheeses);

  for (Cheese q : Cheeses ) {
    frodo.eat(q);
    q.render();
  }
}

void mousePressed() {
  nextAvailableCheese(Cheeses).place(mouseX, mouseY);
}

Cheese nextAvailableCheese(Cheese[] targets) {
  for (Cheese q : targets) {
    if (q.isActive == false)
      return q;
  }

  return targets[0];
}
