boolean debug = false;
Level level;
Player player;
Pathfinder pathfinder;
Tile tile;
Shop shop;
MainHUD mainHUD; //Q 21

boolean isExisting; 



//Shop Variables//////
int coins; //Q 21 
boolean shopOpen; //Q 21

void setup() {
  size(926, 428);
  TileHelper.app = this;
  level = new Level();
  player = new Player();
  pathfinder = new Pathfinder();
  tile = new Tile();
  shop = new Shop();
  mainHUD = new MainHUD();
}
void draw() {
  // UPDATE:
  mainHUD.update(); //Q 21

  player.update();

  // DRAW:
  background(TileHelper.isHex ? 0 : 127);
  level.draw();
  player.draw();


  // TODO: using mouse position, get tile. set it's hover property to true
  if (MouseInTiles()) {
    Point g = TileHelper.pixelToGrid(new PVector(mouseX, mouseY));
    //g = TileHelper.pixelToGrid(new PVector(mouseX, mouseY));
    Tile tile = level.getTile(g);

    tile.hover = true; //
  }

  //Bar at bottom
  fill(0);
  rect(0, height - 80, width, 500);

  mainHUD.draw(); //Q 21
  shop.draw(); //Q 21

  if (shopOpen) { //Opens shop 
    print("ok!!!");
  }

  // TODO: draw a little ellipse in the tile's center
  PVector m = tile.getCenter();
  fill(0);
  ellipse(m.x, m.y, 8, 8); 


  // DRAW DEBUG INFO:
  fill(255, 255, 0);
  //String s1 = (pathfinder.useManhattan) ? "(h) heuristic: manhattan" : "(h) heuristic: euclidian";
  //String s2 = (level.useDiagonals) ? "(d) diagonals: yes" : "(d) diagonals: no";
  //String s3 = (TileHelper.isHex) ? "(g) grid: hex" : "(g) grid: square";
  //String s4 = (debug) ? "(`) debug: on" : "(`) debug: off";
  //text(s1, 10, 15);
  //text(s2, 10, 30);
  //text(s3, 10, 45);
  //text(s4, 10, 60);
}

boolean MouseInTiles() {
  if (mouseX <= width - 80 && mouseY >= height - 50) { //UI area
    return true;
  }
  return false;
}

//Button /////////////////////////////////////////////////////////////////////////////////////////////////////////////
boolean isMouseOver(int x, int y, int w, int h, int buttonHovered) {
  if (mouseX >= x && mouseX <= ( x + w ) && mouseY >= y && mouseY <= ( y + h) ) { //When mouse is hovered over
    fill(255, 80);
    noStroke();
    rect(x, y, w, h);


    fill(buttonHovered);
    rect(x, y, w, h);
    fill(255);//for White Text
    return true;
  } else { //When mouse is NOT hovered over
    noStroke();
    fill(255, 80);
    rect(x, y, w, h);
    return false;
  }
}

void mousePressed() {
  // TODO: set the player's target position to the clicked tile
  if (mouseX <= width && mouseY >= height - 200) { //UI area at the bottom
  } else {
    player.setTargetPosition(TileHelper.pixelToGrid(new PVector(mouseX, mouseY))); //works only
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
