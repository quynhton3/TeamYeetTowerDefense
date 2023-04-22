class CatEntropy extends Tower {

  int randomEnemy;

  CatEntropy(float x, float y) {
    super(x, y, 4);

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
      
    //Check upgrade tier
    //Get a random enemy
    //Attack it
    println("entropy cat attack!");
    ellipse(x, y, 100,100);
  }
  
  void getRandomEnemy(ArrayList enemies) {
    randomEnemy = (int)random(enemies.size());
  }
}
