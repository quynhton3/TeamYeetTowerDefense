class CatLightning extends Tower {
  
  // How many enemies the lighting tower can attack at once
  int maxTargets = 3;
  
  float coolDown = 15, CD = coolDown;
  
  // Arraylist for lighting effect
  ArrayList<PVector> lightningPoints = new ArrayList<PVector>();

  CatLightning(float x, float y) {
    super(x, y, 2);

    //Set Unit Properties
    cost = 1;
    atkDamage = 10;
    atkSpeed = 25.0;
    maxRange = 170;
    
    atkTimer = atkSpeed; //Timer counts down, Speed is a constant value
  }

  void update() {
    super.update();
    CD--;
    if (CD <= 0) {
      CD = coolDown;
      lightningPoints.clear();
    }
  }

  void draw() {
    if (!lightningPoints.isEmpty()) {
      // Draw lightning
      stroke(255,255,0);
      strokeWeight(3);
      PVector fp = lightningPoints.get(0);
      line(x,y,fp.x,fp.y);
      for (int i = 0; i < lightningPoints.size() - 1; i++) {
        PVector p1 = lightningPoints.get(i);
        PVector p2 = lightningPoints.get(i + 1);
        line(p1.x,p1.y,p2.x,p2.y);
      }
      strokeWeight(0);
    }
    
    // Draw range
    //noFill();
    //stroke(255,255,255,50);
    //strokeWeight(1);
    //ellipse(x,y,maxRange * 2,maxRange * 2);
    //noStroke();
    
    super.draw();
  }

  //Unique cat code goes here
  void attack() {
    //println("Attack!");
    
    // Create an array for all enemies to attack
    ArrayList<Enemy> targetEnemies = new ArrayList<Enemy>();
    // Start with the closest enemy
    Enemy firstEnemy = super.getNearestEnemy();
    targetEnemies.add(firstEnemy);
    
    // If the closest enemy isn't in range, don't attack
    PVector ePos = firstEnemy.position;
    float eDist = dist(x,y,ePos.x,ePos.y);
    if (eDist > maxRange) return;
    
    // Find more targets
    for (int i = 0; i < maxTargets - 1; i++) {
      Enemy nextEnemy = getNextTarget(targetEnemies, targetEnemies.get(i));
      if (nextEnemy != null) {
        targetEnemies.add(nextEnemy);
      }
      else {
        // No enemies left to potentially target
        break;
      }
    }
    
    // Damage targeted enemies and draw lighting effect between them
    for (int i = 0; i < targetEnemies.size(); i++) {
      targetEnemies.get(i).hp -= atkDamage;
      PVector lPos = targetEnemies.get(i).position;
      lightningPoints.add(new PVector(lPos.x, lPos.y));
    }
  }
  
  // Find nearest enemy not including that enemy
  Enemy getNextTarget(ArrayList<Enemy> blacklist, Enemy curTarget) {
    
    // Make an arraylist of enemies not including already targeted enemies
    ArrayList<Enemy> newTargets = new ArrayList<Enemy>();
    for (int i = 0; i < enemies.size(); i++) {
      Enemy curEnemy = enemies.get(i);
      if (!blacklist.contains(curEnemy)) {
        newTargets.add(curEnemy);
      }
    }
    
    if (newTargets.isEmpty()) return null;
    
    // Loop through new targets to find the next nearest enemy
    Enemy closestTarget = newTargets.get(0);
    float closestDist = getDistBetweenEnemies(curTarget,closestTarget);
    for (int i = 1; i < newTargets.size(); i++) {
      Enemy curEnemy = newTargets.get(i);
      float curDist = getDistBetweenEnemies(curEnemy,closestTarget);
      if (curDist < closestDist) {
        closestTarget = curEnemy;
        closestDist = curDist;
      }
    }
    
    return closestTarget;
  }
  
  float getDistBetweenEnemies(Enemy enemy1, Enemy enemy2) {
    PVector pos1 = enemy1.position;
    PVector pos2 = enemy2.position;
    return dist(pos1.x,pos1.y,pos2.x,pos2.y);
  }
}
