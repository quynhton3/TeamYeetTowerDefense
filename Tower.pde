// Number values for each tower type
// These are instantiated by the children
int ICE_CAT = 1;
int FIRE_CAT = 2;
int LIGHTING_CAT = 3;
int ENTROPY_CAT = 4;

// This class creates a tower
class Tower {
  //Visual Properties
  float x, y, r, maxRange;
  int towerType;
  PImage img;
  
  //Unit Properties
  float atkDamage, atkSpeed, atkTimer;
  int cost, upgradeLevel;
  
  Tower() {} //Allows children
  Tower(float x, float y, int towerType) {
    this.x = x;
    this.y = y;
    this.towerType = towerType;
    
    r = tileSize; //make this reference the circle size
    upgradeLevel = 1;
    
    img = loadImage("tower" + towerType + ".png");
    
  }
  
  void update() {
    //Attack Speed Timer
    atkTimer -= time;
    
    if (atkTimer <= 0 && enemies.size() > 0 && getNearestEnemy() != null) {
      attack(); //Calls the child's attack function cuz polymorphism
      atkTimer = atkSpeed;
    }
  }
  
  void draw() {
    image(img, x-r, y-r, r*2, r*2);
  }
  
  Enemy getNearestEnemy() {
    //Called by all cats except entropy
    
    Enemy closestEnemy = enemies.get(0);
    float shortestDist = maxRange;
    for (int i = 0; i < enemies.size(); i++) {
      PVector enemyPos = enemies.get(i).position;
      float newDist = dist(enemyPos.x,enemyPos.y,x,y);
      if (newDist < shortestDist) {
        closestEnemy = enemies.get(i);
      }
    }
    
    if (shortestDist == maxRange) {
      return null;
    }
    else {
      return closestEnemy;   
    }
  }
  
  void attack() {} //To be polymorphed
}
