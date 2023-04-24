int defaultHP = 150;

class Enemy extends RadialObject {

  // GRID-SPACE COORDINATES:
  Point gridP = new Point(); // current position
  Point gridT = new Point(); // target position (pathfinding goal)

  // PIXEL-SPACE COORDINATES:
  PVector pixlP = new PVector(); // current pixel position

  ArrayList<Tile> path;    // the path to follow to get to the target position
  boolean findPath = false;
  boolean isDead = false;
  int maxhp, hp, imgSize;

  Enemy() {
    teleportTo(gridP);
    setTargetPosition(TileHelper.pixelToGrid(new PVector(890, 105)));
    maxhp = defaultHP;
    hp = maxhp;
    img = loadImage("fish.png");
    imgSize = 30;
  }
  void teleportTo(Point gridP) {
    Tile tile = level.getTile(gridP);
    if (tile != null) {
      this.gridP = gridP.get();
      this.gridT = gridP.get();
      this.pixlP = tile.getCenter();
    }
  }
  void setTargetPosition(Point gridT) {
    this.gridT = gridT.get();
    findPath = true;
  }
  void update() {
    position = pixlP;
    
    if (findPath == true) findPathAndTakeNextStep();
    updateMove();
  }
  void findPathAndTakeNextStep() {
    findPath = false;
    Tile start = level.getTile(gridP);
    Tile end = level.getTile(gridT);
    if (start == end) {
      path = null;
      return;
    }
    path = pathfinder.findPath(start, end);

    if (path != null && path.size() > 1) { 
      Tile tile = path.get(1);
      if(tile.isPassable()) gridP = new Point(tile.X, tile.Y);
    }
  }
  void updateMove() {
    
    float snapThreshold = 1;
    PVector pixlT = level.getTileCenterAt(gridP);
    PVector diff = PVector.sub(pixlT, pixlP);
    
    pixlP.x += diff.x * .2;
    pixlP.y += diff.y * .2;
    
    if (abs(diff.x) < snapThreshold) pixlP.x = pixlT.x;
    if (abs(diff.y) < snapThreshold) pixlP.y = pixlT.y;

    if (pixlT.x == pixlP.x && pixlT.y == pixlP.y) findPath = true;
  }
  void draw() {
    noStroke();
    float healthColor = 255.0 * ((float)hp / (float)maxhp);
    fill(255,healthColor,healthColor); //Enemy color
    tint(255,healthColor,healthColor);
    //ellipse(pixlP.x, pixlP.y, 22, 22);
    image(img, pixlP.x-imgSize/2, pixlP.y-imgSize/2, imgSize, imgSize);
    noTint();
    drawPath(); 
  }
  void drawPath() {
    if (path != null && path.size() > 1) {
      stroke(0);
      PVector prevP = pixlP.get();
      for (int i = 1; i < path.size (); i++) {
        PVector currP = path.get(i).getCenter();
        //line(prevP.x, prevP.y, currP.x, currP.y);
        prevP = currP;
      }
      noStroke();
      //ellipse(prevP.x, prevP.y, 8, 8); //dot where it ends
    }
  }
}
