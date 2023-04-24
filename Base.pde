class Base extends RadialObject{
  int maxhp = 10;
  int hp = maxhp;
  
  Base() {
    position = new PVector(875,275);
  }
  
  void draw() {
    fill(#FF0303);
    ellipse(position.x, position.y, 25,25);
    noFill();
    
    textSize(12);
    textAlign(CENTER,CENTER);
    fill(255);
    int displayhp = hp < 1 ? 0 : hp;
    text("HP: " + displayhp, position.x, position.y - 25);
    textAlign(LEFT,TOP);
  }
}
