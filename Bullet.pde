class Bullet {
  float x, y;
  float speed = 400;
  float damage = 50;
  float angle;
  PVector target = new PVector();
  boolean isDead = false;
  boolean hasExploded = false;
  boolean doOnce = true;
  float coolDown = 0.5; // Fuse Timer
  float blastRadius = 100;
  float diminishTime = 2; // Explosion Radius circle diminish time
  float strokeAlpha = 200;
  float radius = 2;
  PImage img;

  Bullet(float xPos, float yPos) {
    x = xPos;
    y = yPos;
  //  img = loadImage("macbullet.png");
  }

  void update() {
    float dx = target.x - x;
    float dy = target.y - y;
    angle = atan2(dy, dx);
    float dis = sqrt(dx * dx + dy * dy);

    if (dis > 5) {
      x +=  speed * cos(angle) ; // x = x + dx * friction;
      y +=  speed * sin(angle) ;
      


        // Check for collision with any enemies
        // If enemies are colliding with blast radius
        // Apply Damage to those enemies
        hasExploded = true;
      
    }


  }

  void draw() {

      stroke(255, 255, 255, strokeAlpha);
      strokeWeight(2);
      noFill();
      ellipse(x, y, blastRadius*2, blastRadius*2);
    
  }
}
