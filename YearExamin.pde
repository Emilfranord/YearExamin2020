Cheese[] Cheeses = {new Cheese(), new Cheese(), new Cheese()};
Cheese[] CheesesI = new Cheese[10]; // TODO: give array values in setup 
Cheese CheesesII = new Cheese();
Mouse frodo = new Mouse();


void setup() {
  fullScreen();
}

void draw() {
  background(125);
  noStroke();
  CheesesII.render();
}

void mousePressed() {
  CheesesII.place(mouseX,mouseY);
  CheesesII.eat();
  nextAvailableCheese(Cheeses).place(mouseX,mouseY);
}

Cheese nextAvailableCheese(Cheese[] targets) {
  for (Cheese q : targets) {
    if (q.isActive == false)
      return q;
  }

  return targets[0];
}
