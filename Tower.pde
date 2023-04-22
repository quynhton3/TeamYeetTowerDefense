// Number values for each tower type
// These are instantiated by the children
int ICE_CAT = 3;
int FIRE_CAT = 1;
int LIGHTING_CAT = 2;
int ENTROPY_CAT = 4;

// This class creates a tower
class Tower extends RadialObject {
  //Visual Properties
  float x, y, r;
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

    if (atkTimer <= 0) {

      attack(); //Calls the child's attack function cuz polymorphism
      atkTimer = atkSpeed;
    }
  }

  void draw() {
    image(img, x-r, y-r, r*2, r*2);

    //ellipse(
  }

  void getNearestEnemy() {
    //Called by all cats except entropy
  }

  void attack() {
  } //To be polymorphed
}
