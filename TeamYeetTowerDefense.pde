boolean debug = false;
Level level;
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
ArrayList<Icicle> icicles = new ArrayList<Icicle>();
int enemyMaxCD = 100;
int enemySpawnCD = enemyMaxCD;
Pathfinder pathfinder;
Base base;
Tile tile;
Shop shop; //Q 21
MainHUD mainHUD; //Q 21
boolean gameStarted = false;

//SOUNDS ///////////////////////////////////////////////////////////////////////////////////////////////
//Music from https://uppbeat.io/browse/music/lo-fi-beats?rt=ppc_google_performance_general_usa&utm_source=google&utm_medium=cpc&utm_campaign=search_performance_usa&utm_content=&utm_term=&gad=1&gclid=Cj0KCQjwi46iBhDyARIsAE3nVraK6LP2o6mq-DvnGFVBQAmAHif89dX3iCAZWTFYNwOLoR-uuvC25Y4aArx1EALw_wcB
import ddf.minim.*;
Minim minim;
AudioPlayer bgMusic;
AudioPlayer meow;
AudioPlayer camera;
AudioPlayer mouseClick; 
AudioPlayer mouseClickDeep;
AudioPlayer coinSFX;

// PICTURES /////////////////////////////////////////////////////////////////////////////////////////////
PImage titleScreen;
PImage gameOverScreen;
int titleTimer = 100;




boolean isExisting;
int money = 500;
int score;

//Towers/Cats stuff 
int tileSize;
float time;
ArrayList<Tower> towers = new ArrayList<Tower>();

boolean fireCatAttacked, lightningCatAttack, iceCatAttack, entropyCatAttacked;
int cat1X = 225, cat1Y = 225, cat2X = 525, cat2Y = 225, cat3X = 625, cat3Y = 225, cat4X = 424, cat4Y = 225; //Cat's positions for the easier spawning way xD 
int VFXTimer; 

//Shop Variables/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
int defaultCoins = 500;
int coins = defaultCoins; //Q 21 
boolean shopOpen; //Q 21

int shopBGX = 150, shopBGY = 25, shopBGX2 = 775, shopBGY2 = 400; //Q 21
boolean hasFire, hasIce, hasLightning, hasEntrophy, hasRock, hasLog; //Q 21
int fireCost = 200, iceCost = 400, lightningCost = 500, entropyCost = 600, rockCost = 150, logCost = 200; //Q 21
int descriptionX = 170, descriptionY = 300;
boolean isCircleMode;

//Shop Buttons ///////////////////////////////////////////////////////////////////////
int buyX = 570, buyY = 300, buyW = 185, buyH = 70;

//Main HUD Variables /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
int shopX = 30, shopY = 380, shopW = 150, shopH = 30;
int playX = 720, playY = 380, playW = 150, playH = 30;


boolean mouseClicked; //Q 21

ArrayList<TowerIcon> towerIcons = new ArrayList<TowerIcon>();
ArrayList<PImage> towerIconSprites = new ArrayList<PImage>();

void setup() {
  background(5);
  size(926, 428);
  TileHelper.app = this;
  level = new Level();
  base = new Base();
  pathfinder = new Pathfinder();
  tile = new Tile();
  shop = new Shop();
  mainHUD = new MainHUD();

  tileSize = TileHelper.W/2;
  time = (float)millis()/1000.0;




  // PICS //////////////////////////////////////
  titleScreen = loadImage("catTowerTitle.png");
  gameOverScreen = loadImage("gameOverCatTower.png");
  // MUSIC ////////////////////////////////////
  minim = new Minim(this); 
  bgMusic = minim.loadFile("bgMusic.mp3");
  bgMusic.setGain(-15);
  
  meow = minim.loadFile("meow.mp3");
  meow.setGain(-5);
  camera = minim.loadFile("camera.wav");
  camera.setGain(-10);
  mouseClick = minim.loadFile("mouseClick.mp3");
  mouseClick.setGain(-5);
  mouseClickDeep = minim.loadFile("mouseClickDeep.wav");
  mouseClickDeep.setGain(-20);
  coinSFX = minim.loadFile("coinSFX.wav");
  coinSFX.setGain(-10);
  
  towerIcons.add(new TowerIcon(50,385,40,40,FIRE_CAT));
  towerIcons.add(new TowerIcon(150,385,40,40,LIGHTNING_CAT));
  towerIcons.add(new TowerIcon(250,385,40,40,ICE_CAT));
  towerIcons.add(new TowerIcon(350,385,40,40,ENTROPY_CAT));
  
  // Fire cat description
  towerDesc.add("Attacks in a radius around itself. Likes hanging with Brandon in\nIRC 104. Appreciates Brandon's work and looks up to\nhis soundboard. Big fan of Mike.");
  
  // Lightning cat description
  towerDesc.add("Lightning attacks bounce between enemies! Favorite person\nis CodeGods Jennyboo and Jay <344. Thinks James is funny.");
  
  // Ice cat description
  towerDesc.add("Able to do up to 30 damage to an enemy!! Enjoys the Khelben.\nThinks Khelben has a big head. Is v fond of Mr.Ty & amused by\nhis comments.");
  
  // Entropy cat description
  towerDesc.add("Attacks random enemies! Works out and likes long walks on\nthe beach. Works out with Fill, the Vaarun, and Seabasses!");
  
  towerIconSprites.add(loadImage("tower1.png"));
  towerIconSprites.add(loadImage("tower2.png"));
  towerIconSprites.add(loadImage("tower3.png"));
  towerIconSprites.add(loadImage("tower4.png"));
  
  for (int i = 0; i < towerIconSprites.size(); i++) {
    towerIconSprites.get(i).resize(40,40);
  }
}
void draw() {
  // UPDATE:
  //println(towers.size());
  mainHUD.update(); //Q 21
  shop.update(); //Q 21

  //coins ++; //Q 21
  score ++; //Q 22

  enemySpawnCD--;
  /////////////////////////////Enemies spawner
  if (enemySpawnCD<=0) {
    enemyMaxCD *= 0.99;
    if (enemyMaxCD <= 20) {
      enemyMaxCD = 20;
    }
    defaultHP *= 1.05;
    Enemy e = new Enemy();
    enemies.add(e);
    enemySpawnCD= enemyMaxCD;
  }


  for (int i = 0; i <enemies.size(); i++) {
    Enemy e = enemies.get(i);
    e.update();
    PVector ePos = e.position;
    float eDist = dist(ePos.x,ePos.y,base.position.x,base.position.y);
    if (e.checkCollision(base) || eDist < 60) {
      base.hp--;
      //println(base.hp);
      e.isDead = true;
    }
    if (e.hp <= 0) {
      e.isDead=true;
    }
    if (e.isDead) {
      enemies.remove(e);
      coins += 30;
    }
  }
  for (int i = 0; i <towers.size(); i++) {
    Tower t = towers.get(i);
    t.update();
    for (int j = 0; j <enemies.size(); j++) {
      Enemy e = enemies.get(j);
      if (e.checkCollision(t)) {
        //e.hp--;
      }
      ;
    }
  }
  
  for (int i = 0; i < icicles.size(); i++) {
    icicles.get(i).update();
    if (icicles.get(i).isDead) {
      icicles.remove(i);
    }
  }

  // DRAW:
  background(TileHelper.isHex ? 0 : 127);
  level.draw();
  base.draw();
  for (int i = 0; i <enemies.size(); i++) {
    Enemy e = enemies.get(i);
    e.draw();
  }
  for (Tower t : towers) {
    t.draw();
  }
  
  for (int i = 0; i < icicles.size(); i++) {
    icicles.get(i).draw();
  }

  //Bar at Bottom
  fill(0);
  rect(0, height - 70, width, 500);

  //print(VFXTimer);
  mainHUD.draw(); //Q 21

  //DRAWS TITLE SCREEN ////////////////////////////////////////////////////////
  titleTimer --;
  if ( titleTimer > 0) {
    image(titleScreen, 0, 0);
    textAlign(CENTER, CENTER);
    fill(255, 50);
    text("L O A D I N G . . .", width/2, height/2 +50);
  } else if (titleTimer <= 0) {
    titleTimer = 0;
    
    // Runs once when game starts
    if (!gameStarted) {
      bgMusic.loop();
      gameStarted = true;
    }
  };
  // TODO: using mouse position, get tile. set it's hover property to true
  //if (MouseInTiles()) {
  //  Point g = TileHelper.pixelToGrid(new PVector(mouseX, mouseY));
  //  //g = TileHelper.pixelToGrid(new PVector(mouseX, mouseY));
  //  Tile tile = level.getTile(g);

  //  tile.hover = true; //
  //}


  // VFX /////////////////////////////////////////////////////////////////////////////////
  //fill(200, 0, 0, 200); //Red
  //if (fireCatAttacked && VFXTimer > 0) {
  //  ellipse(cat1X, cat2Y, 150, 150); 
  //  VFXTimer--;
  //  fireCatAttacked = false;
  //} else if (VFXTimer <= 0) { //
  //  fireCatAttacked = false;
  //  VFXTimer = 30;
  //}



  // TODO: draw a little ellipse in the tile's center
  PVector m = tile.getCenter();
  fill(0);
  //ellipse(m.x, m.y, 8, 8); //Tiny dot on the start 


  // DRAW DEBUG INFO:
  //fill(255, 255, 0);
  //String s1 = (pathfinder.useManhattan) ? "(h) heuristic: manhattan" : "(h) heuristic: euclidian";
  //String s2 = (level.useDiagonals) ? "(d) diagonals: yes" : "(d) diagonals: no";
  //String s3 = (TileHelper.isHex) ? "(g) grid: hex" : "(g) grid: square";
  //String s4 = (debug) ? "(`) debug: on" : "(`) debug: off";
  //text(s1, 10, 15);
  //text(s2, 10, 30);
  //text(s3, 10, 45);
  //text(s4, 10, 60);
  if (shopOpen) { //Opens shop 
    shop.draw(); //Q 21
    mouseClick.play();
  }
  
  if (titleTimer <= 0) {
    for (int i = 0; i < towerIcons.size(); i++) {
      TowerIcon curIcon = towerIcons.get(i);
      curIcon.update();
      curIcon.draw();
    }
  }
  
  if (base.hp <= 0) {
    fill(255,0,0,100);
    rectMode(CORNER);
    rect(0,0,width,height);
    textAlign(CENTER,CENTER);
    fill(255);
    textSize(30);
    text("Oh nyos, the base is die ;w;", width / 2, height / 2);
    fill(220);
    textSize(15);
    text("Pwess Enter to pway again :3", width / 2, height / 2 + 40);
    textAlign(LEFT,TOP);
  }
} //END OF DRAW///////////////////////////////////////////////////////////////////////////////////////////////////////

boolean MouseInTiles() {
  if (mouseX <= width - 50 && mouseY >= height - 50) { //UI area
    return true;
  }
  return false;
}


//Button /////////////////////////////////////////////////////////////////////////////////////////////////////////////
boolean isMouseOver(int x, int y, int w, int h, int buttonHovered) {
  if (mouseX >= x && mouseX <= ( x + w ) && mouseY >= y && mouseY <= ( y + h) ) { //When mouse is hovered over
    fill(255, 80);
    noStroke();
    rect(x, y, w, h, 2);

    fill(buttonHovered);
    rect(x, y, w, h, 2);
    fill(255);//for White Text
    return true;
  } else { //When mouse is NOT hovered over
    noStroke();
    fill(255, 80);
    rect(x, y, w, h, 2);
    return false;
  }
}
void mousePressed() {
  // TODO: set the player's target position to the clicked tile
  //if (mouseX <= width && mouseY >= height - 200) { //UI area
  //} else {
  //player.setTargetPosition(TileHelper.pixelToGrid(new PVector(mouseX, mouseY))); //works only

  // BUTTONNNNNNNNNNNNNNNNNNN //////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //if (mouseButton == LEFT) { //Q 21
  //  mouseClicked = true;
  //  mouseClicked = false;
  //  //Main HUD /////////////////////////////////////////////////////////////////////////////
  //  if (isMouseOver(shopX, shopY, shopW, shopH, 255)) { //Shop Button
  //    shopOpen =true;
  //    mouseClickDeep.rewind();
  //    mouseClickDeep.play();
  //  }

  //  //Selected Item/////////////////////////////////////////////////////////////////////////
  //  if (isMouseOver(175, 125, 75, 75, 255) && coins >= fireCost) { //Fire 
  //    hasFire = true;
  //    mouseClickDeep.rewind();
  //    mouseClickDeep.play();
  //  }
  //  if (isMouseOver(275, 125, 75, 75, 255) && coins >= lightningCost) { //Lightning
  //    hasLightning = true;
  //    mouseClick.rewind();
  //    mouseClick.play();
  //  }
  //  if (isMouseOver(375, 125, 75, 75, 255) && coins >= iceCost) { //Ice
  //    hasIce = true;
  //    mouseClick.rewind();
  //    mouseClick.play();
  //  }
  //  if (isMouseOver(475, 125, 75, 75, 255) && coins >= entrophyCost) { //Entrophy
  //    hasEntrophy = true;
  //    mouseClick.rewind();
  //    mouseClick.play();
  //  }
  //  if (isMouseOver(575, 125, 75, 75, 255) && coins >= rockCost) { //Rock
  //    //  hasRock = true;
  //    isCircleMode = true;
  //  }
  //  //if (isMouseOver(675, 125, 75, 75, 255)) { //Log
  //  //  hasLog = true;
  //  //}

  //  if (isMouseOver(675, 25, 100, 50, 200)) { //Exit button
  //    mouseClick.rewind();
  //    mouseClick.play();

  //    shopOpen = false;
  //  }


  //  //Brought///////////////////////////////////////////////////////////////////////////////
  //  if (isMouseOver(buyX, buyY, buyW, buyH, 200) && hasFire) { //Buy Button
  //    //Drag log code here: @James
  //    coins -= fireCost;
  //    towers.add(new CatFire(cat1X, cat1Y));
  //    hasFire = false;
  //    VFXTimer = 20;
  //    meow.rewind();
  //    meow.play();
  //    camera.rewind();
  //    camera.play();
  //    coinSFX.rewind();
  //    coinSFX.play();

  //    shopOpen = false;
  //  }
  //  if (isMouseOver(buyX, buyY, buyW, buyH, 200) && hasLightning) { //Buy Button
  //    //Drag log code here: @James
  //    coins -= lightningCost;
  //    towers.add(new CatLightning(cat2X, cat2Y));
  //    hasLightning = false;
  //    meow.rewind();
  //    meow.play();
  //    camera.rewind();
  //    camera.play();
  //    coinSFX.play();

  //    shopOpen = false;
  //  }
  //  if (isMouseOver(buyX, buyY, buyW, buyH, 200) && hasIce) { //Buy Button
  //    //Drag log code here: @James
  //    coins -= iceCost;
  //    towers.add(new CatIce(cat3X, cat3Y));
  //    hasIce = false;
  //    meow.rewind();
  //    meow.play();
  //    camera.rewind();
  //    camera.play();
  //    coinSFX.rewind();
  //    coinSFX.play();

  //    shopOpen = false;
  //  }
  //  if (isMouseOver(buyX, buyY, buyW, buyH, 200) && hasEntrophy) { //Buy Button
  //    //Drag log code here: @James
  //    towers.add(new CatEntropy(cat4X, cat4Y));
  //    coins -= entrophyCost;
  //    hasEntrophy = false;
  //    meow.rewind();
  //    meow.play();
  //    camera.rewind();
  //    camera.play();
  //    coinSFX.rewind();
  //    coinSFX.play();
  //    shopOpen = false;
  //  }
  //}
  //}//End mousePressed
} // end of MousePressed
void keyPressed() {
  //if (debug) println(keyCode);

  if (keyCode == 49) level.loadLevel(LevelDefs.LEVEL1);
  if (keyCode == 50) level.loadLevel(LevelDefs.LEVEL2);
  if (keyCode == 51) level.loadLevel(LevelDefs.LEVEL3);
  if (keyCode == 52) level.loadLevel(LevelDefs.LEVEL4);
  if (keyCode == 53) level.loadLevel(LevelDefs.LEVEL5);

  if (keyCode == 68) {
    level.toggleDiagonals();
    level.reloadLevel();
  }
  if (keyCode == 71) {
    TileHelper.isHex = !TileHelper.isHex;
    level.reloadLevel();
  }
  if (keyCode == 72) pathfinder.toggleHeuristic();
  if (keyCode == 222) debug = !debug;
  
  if (base.hp < 1 && keyCode == 10) startNewGame();
}

void startNewGame() {
  towers.clear();
  enemies.clear();
  score = 0;
  coins = defaultCoins;
  base.hp = base.maxhp;
  defaultHP = 150;
  enemyMaxCD = 100;
}
