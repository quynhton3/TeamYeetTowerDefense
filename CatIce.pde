class CatIce extends Tower {

  float spread = 15;
  
  CatIce(float x, float y) {
    super(x, y, 3);

    //Set Unit Properties
    cost = 1;
    atkDamage = 60;
    atkSpeed = 20.0;
    
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
    println("ice cat attack!");
    
    Enemy e = getNearestEnemy();
    float angleToTarget = calcAngleToTarget(new PVector(x,y), e.position) - radians(90);
    icicles.add(new Icicle(x,y,angleToTarget,atkDamage));
    icicles.add(new Icicle(x,y,angleToTarget + radians(spread),atkDamage));
    icicles.add(new Icicle(x,y,angleToTarget - radians(spread),atkDamage));
    if (upgradeLevel >= 2) {
      icicles.add(new Icicle(x,y,angleToTarget + radians(spread * 2),atkDamage));
      icicles.add(new Icicle(x,y,angleToTarget - radians(spread * 2),atkDamage));
    }
  }
}

// This class makes the projectiles for the ice cat
class Icicle {
  
  PVector pos = new PVector();
  float speed = 20;
  float angle;
  boolean isDead = false;
  
  float size = 10;
  float damage = 17;
  float atkDamage;
  
  Icicle(float xPos, float yPos, float newAngle, float atkDamage) {
    pos.x = xPos;
    pos.y = yPos;
    angle = newAngle + radians(90);
    this.atkDamage = atkDamage;
  }
  
  void update() {
    pos.x += speed * cos(angle) * time;
    pos.y += speed * sin(angle) * time;
    
    for (int i = 0; i < enemies.size(); i++) {
      Enemy e = enemies.get(i);
      PVector ePos = e.position;
      if (dist(ePos.x,ePos.y,pos.x,pos.y) < size * 1.5) {
        isDead = true;
        e.hp -= atkDamage;
      }
    }
  }
  
  void draw() {
    fill(150,150,255);
    //fill(#FFB908);
    //stroke(#FFF308);
    
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(angle);
    rect(0,0,size,size * 0.7);
    popMatrix();
  }
}

float calcAngleToTarget(PVector currPos, PVector targetPos) {
  return atan2(targetPos.y - currPos.y, targetPos.x - currPos.x);
}
