class CatEntropy extends Tower {

  int randomEnemy;
  
  PVector atkPoint;
  float circleMaxSize = 120;
  float circleSize = 0;

  CatEntropy(float x, float y) {
    super(x, y, 4);

    //Set Unit Properties
    cost = 1;
    atkDamage = defaultHP + 1;
    atkSpeed = 40.0;
    
    atkTimer = atkSpeed; //Timer counts down, Speed is a constant value
  }

  void update() {
    super.update();
  }

  void draw() {
    super.draw();
    
    if (atkPoint != null && circleSize < circleMaxSize) {
      circleSize += 6;
      fill(150,0,255,255 - 255 * (circleSize * 2 / circleMaxSize));
      ellipse(atkPoint.x,atkPoint.y,circleSize * 2,circleSize * 2);
    }
    else {
      circleSize = 0;
      atkPoint = null;
    }
  }

  //Unique cat code goes here
  void attack() {
    println("entropy cat attack!");
    
    //Check upgrade tier
    //Get a random enemy
    Enemy randomEnemy = getRandomEnemy();
    //Attack it
    randomEnemy.hp -= atkDamage;
    
    // Attack effect
    atkPoint = randomEnemy.position;
  }
  
  Enemy getRandomEnemy() {
    return enemies.get((int)random(enemies.size()));
  }
}
