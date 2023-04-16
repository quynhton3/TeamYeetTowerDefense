// Number values for each tower type
int ICE_CAT = 1;
int FIRE_CAT = 2;
int LIGHTING_CAT = 3;
int ENTROPY_CAT = 4;

// This class creates a tower
class Tower {
  float x, y;
  int towerType;
  
  Tower(float x, float y, int towerType) {
    this.x = x;
    this.y = y;
    this.towerType = towerType;
  }
}
