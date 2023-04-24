class CatFire extends Tower {
  float ringSize = 0;
  float ringMaxSize;
  
  CatFire(float x, float y) {
    super(x, y, 1);

    //Set Unit Properties
    cost = 1;
    atkDamage = 40;
    atkSpeed = 15.0;

    atkTimer = atkSpeed; //Timer counts down, Speed is a constant value
    
    maxRange = 130;
    ringMaxSize = maxRange * 1.3;
  }

  void update() {
    super.update();
    ringSize += 3;
  }

  void draw() {
    fill(255,0,0,255 - 255 * (ringSize * 2 / ringMaxSize));
    ellipse(x,y,ringSize * 2, ringSize * 2);
    if (ringSize * 2 > ringMaxSize) {
      ringSize = 0;
    }
    noTint();
    super.draw();
  }

  //Unique cat code goes here
  void attack() {
    //fireCatAttacked = true; 
    
    //println("fire cat attack!"+1);
    
    for (int i = 0; i < enemies.size(); i++) {
      Enemy cEnemy = enemies.get(i);
      PVector cPos = cEnemy.position;
      if (dist(x,y,cPos.x,cPos.y) <= maxRange) {
        cEnemy.hp -= atkDamage;
      }
    }
  }
}
