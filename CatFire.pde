class CatFire extends Tower {
  int timer = 100;
  CatFire(float x, float y) {
    super(x, y, 1);

    //Set Unit Properties
    cost = 1;
    atkDamage = 1;
    atkSpeed = 10.0;

    atkTimer = atkSpeed; //Timer counts down, Speed is a constant value
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
