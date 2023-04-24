class CatFire extends Tower {
  float coolDown = 15, CD = coolDown;
  
  CatFire(float x, float y) {
    super(x, y, 1);

    //Set Unit Properties
    cost = 1;
    atkDamage = 1;
    atkSpeed = 15.0;

    atkTimer = atkSpeed; //Timer counts down, Speed is a constant value
    
    maxRange = 70;
  }

  void update() {
    super.update();
  }

  void draw() {
    super.draw();
  }

  //Unique cat code goes here
  void attack() {
    fireCatAttacked = true; 
    
    //println("fire cat attack!"+1);
  }
}
