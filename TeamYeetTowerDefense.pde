boolean debug = false;
Level level;
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
int enemySpawnCD = 100;
Pathfinder pathfinder;
Tile tile;
boolean isExisting;

//Towers/Cats stuff
int tileSize;
float time;
ArrayList<Tower> towers = new ArrayList<Tower>();

void setup() {
  size(926, 428);
  TileHelper.app = this;
  level = new Level();
  
  pathfinder = new Pathfinder();
  tile = new Tile();

  tileSize = TileHelper.W;
  time = (float)millis()/1000.0;
}
void draw() {
  // UPDATE:
   enemySpawnCD--;
  /////////////////////////////Enemies spawner
  if(enemySpawnCD<=0){
     Enemy e = new Enemy();
     enemies.add(e);
     enemySpawnCD=100;
     
  }
  
   for (int i = 0; i <enemies.size(); i++) {
  Enemy e = enemies.get(i);
   e.update();
  
  }
  for (Tower t : towers) {
    t.update();
  }

  // DRAW:
  background(TileHelper.isHex ? 0 : 127);
  level.draw();
  for (int i = 0; i <enemies.size(); i++) {
  Enemy e = enemies.get(i);
   e.draw(); 
  }
  for (Tower t : towers) {
    t.draw();
  }

  // TODO: using mouse position, get tile. set it's hover property to true
  if (MouseInTiles()) {
    Point g = TileHelper.pixelToGrid(new PVector(mouseX, mouseY));
    //g = TileHelper.pixelToGrid(new PVector(mouseX, mouseY));
    Tile tile = level.getTile(g);

    tile.hover = true; //
  }
  rect(0, height - 100, width, 500);

  // TODO: draw a little ellipse in the tile's center
  PVector m = tile.getCenter();
  fill(0);
  ellipse(m.x, m.y, 8, 8);


  // DRAW DEBUG INFO:
  fill(255, 255, 0);
  String s1 = (pathfinder.useManhattan) ? "(h) heuristic: manhattan" : "(h) heuristic: euclidian";
  String s2 = (level.useDiagonals) ? "(d) diagonals: yes" : "(d) diagonals: no";
  String s3 = (TileHelper.isHex) ? "(g) grid: hex" : "(g) grid: square";
  String s4 = (debug) ? "(`) debug: on" : "(`) debug: off";
  text(s1, 10, 15);
  text(s2, 10, 30);
  text(s3, 10, 45);
  text(s4, 10, 60);
}

boolean MouseInTiles() {
  if (mouseX <= width - 100 && mouseY >= height - 50) { //UI area
    return true;
  }
  return false;
}


void mousePressed() {
  // TODO: set the player's target position to the clicked tile
  if (mouseX <= width && mouseY >= height - 200) { //UI area
  } else {
    //player.setTargetPosition(TileHelper.pixelToGrid(new PVector(mouseX, mouseY))); //works only
  }
}
void keyPressed() {
  if (debug) println(keyCode);


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
}
