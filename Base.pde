class Base extends RadialObject {
  int maxhp = 10;
  int hp = maxhp;

  Base() {
    position = new PVector(890, 105);
  }

  void draw() {
    fill(#3BE0FF, 155);
    ellipse(position.x, position.y, 25, 25);
    noFill();

    textSize(12);
    textAlign(CENTER, CENTER);
    fill(255);
    int displayhp = hp < 1 ? 0 : hp;
    text("HP: " + displayhp, position.x, position.y - 25);
    textAlign(LEFT, TOP);
  }
}
