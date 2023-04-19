class CatLightning extends Tower {
  
  // How many enemies the lighting tower can attack at once
  int maxTargets = 3;

  CatLightning(float x, float y) {
    super(x, y, 1);

    //Set Unit Properties
    cost = 1;
    atkDamage = 1;
    atkSpeed = 10.0;
    maxRange = 30;
    
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
      targetEnemies.add(getNextTarget(targetEnemies.get(i)));
    }
  }
  
  // Find nearest enemy not including that enemy
  Enemy getNextTarget(Enemy enemy) {
    Enemy closestEnemy = getDifEnemy(enemy);
    float shortestDist = getDistBetweenEnemies(enemy,closestEnemy);
    for (int i = 0; i < enemies.size(); i++) {
      if (enemies.get(i) != enemy) {
        Enemy curEnemy = enemies.get(i);
        float newDist = getDistBetweenEnemies(enemy,curEnemy);
        if (newDist < shortestDist) {
          closestEnemy = enemies.get(i);
          shortestDist = newDist;
        }
      }
    }
    return closestEnemy;
  }
  
  // Get an enemy that is not enemy
  Enemy getDifEnemy(Enemy enemy) {
    for (int i = 1; i < enemies.size(); i++) {
      if (enemies.get(i) != enemy) {
        return enemies.get(i);
      }
    }
    return null;
  }
  
  float getDistBetweenEnemies(Enemy enemy1, Enemy enemy2) {
    PVector pos1 = enemy1.position;
    PVector pos2 = enemy2.position;
    return dist(pos1.x,pos1.y,pos2.x,pos2.y);
  }
}
