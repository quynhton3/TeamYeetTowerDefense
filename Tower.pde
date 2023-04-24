// This class creates a tower
class Tower extends RadialObject {
  //Visual Properties
  float x, y, r, maxRange;
  int towerType;
  PImage img;

  //Unit Properties
  float atkDamage, atkSpeed, atkTimer;
  int cost, upgradeLevel;

  Tower() {
  } //Allows children
  Tower(float x, float y, int towerType) {
    this.x = x;
    this.y = y;
    this.towerType = towerType;

    this.position = new PVector(x, y);
    this.radius = 100; //Attack Radius 


    r = tileSize; //make this reference the circle size
    upgradeLevel = 1;

    img = loadImage("tower" + towerType + ".png");
  }

  void update() {
    //Attack Speed Timer
    atkTimer -= time;

    if (atkTimer <= 0 && !enemies.isEmpty()) {

      attack(); //Calls the child's attack function cuz polymorphism
      atkTimer = atkSpeed;
    }
  }

  void draw() {
    image(img, x-r, y-r, r*2, r*2);

    //ellipse(
  }

  Enemy getNearestEnemy() {
    //Called by all cats except entropy
    Enemy closestEnemy = enemies.get(0);
    float closestDist = dist(x,y,closestEnemy.position.x,closestEnemy.position.y);
    for (int i = 1; i < enemies.size(); i++) {
      Enemy curEnemy = enemies.get(i);
      float curDist = dist(x,y,curEnemy.position.x,curEnemy.position.y);
      if (curDist < closestDist) {
        closestEnemy = curEnemy;
        closestDist = curDist;
      }
    }
    return closestEnemy;
  }

  void attack() {
  } //To be polymorphed
}
