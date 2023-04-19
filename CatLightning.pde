class CatLightning extends Tower {
  
  // How many enemies the lighting tower can attack at once
  int maxTargets = 3;

  CatLightning(float x, float y) {
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
    println("lightning cat attack!");
    
    ArrayList<Enemy> targetEnemies = new ArrayList<Enemy>();
    targetEnemies.add(super.getNearestEnemy());
    for (int i = 0; i < maxTargets - 1; i++) {
      
    }
  }
  
  // Find nearest enemy not including that enemy
  void findNearestEnemyFromEnemy(Enemy enemy) {
    
  }
}
