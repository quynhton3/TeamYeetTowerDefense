// This tab has most of the code for gui classes and tower dragging

// Number values for each tower type
int FIRE_CAT = 1;
int LIGHTNING_CAT = 2;
int ICE_CAT = 3;
int ENTROPY_CAT = 4;

PImage icon1, icon2, icon3, icon4;

ArrayList<String> towerDesc = new ArrayList<String>();

// Button that's currently being hovered over
GuiButton hoveringButton;

// Previous tower that was hovered over
TowerIcon hoveringTower;

// Tower that's currently being dragged
TowerIcon heldIcon;

// Is the player currently dragging their mouse?
boolean dragging = false;

// This class creates a gui button
class GuiButton {
  
  float x, y, xSize, ySize;
  boolean hovering, snapToGrid = false;
  
  GuiButton(float x, float y, float xSize, float ySize) {
    this.x = x;
    this.y = y;
    this.xSize = xSize;
    this.ySize = ySize;
  }
  
  void update() {
    checkHover();
  }
  
  // Draw method for debugging
  void draw() {
    rectMode(CENTER);
    noStroke();
    // Draw a simple box that turns grey when hovered over
    fill(hovering ? 180 : 255);
    rect(x,y,xSize,ySize);
    rectMode(CORNER);
  }
  
  // Check if the player is hovering over this button
  void checkHover() {
    // Don't check for hovering if the player is dragging their mouse
    if (!dragging) {
      float xHalf = xSize / 2;
      float yHalf = ySize / 2;
      if (mouseX > this.x - xHalf
        && mouseX < this.x + yHalf
        && mouseY > this.y - yHalf
        && mouseY < this.y + yHalf) {
        hoveringButton = this;
        hovering = true;
      }
      else if (hoveringButton == this) {
        hoveringButton = null;
        hovering = false;
      }
    }
  }
}

// This class creates a tower icon that can be dragged onto the screen
class TowerIcon extends GuiButton {
  int towerType;
  
  TowerIcon(float x, float y, float xSize, float ySize, int towerType) {
    super(x,y,xSize,ySize);
    this.towerType = towerType;
  }
  
  void update() {
    super.update();
    if (hovering) {
      hoveringTower = this;
    }
    if (heldIcon == this) {
      // Move tower with mouse
      if (dragging) {
        drawFakeTower();
      }
      // Release tower
      else {
        heldIcon = null;
        
        float newXPos = mouseX;
        float newYPos = mouseY;
        
        if (snapToGrid) {
          newXPos = mouseX - mouseX % 50 + 25;
          newYPos = mouseY - (mouseY % 50) + 25;
          if ((newXPos - 25) % 50 == 0) {
            newYPos += 25;
          }
        }
        
        Tile placeTile = level.getTile(TileHelper.pixelToGrid(new PVector(mouseX,mouseY)));
        if (placeTile.TERRAIN != 2 || mouseY > 350) return;
        
        // Place new tower
        if (towerType == 1) {
          towers.add(new CatFire(newXPos, newYPos));
          coins -= fireCost;
        }
        else if (towerType == 2) {
          towers.add(new CatLightning(newXPos, newYPos));
          coins -= lightningCost;
        }
        else if (towerType == 3) {
          towers.add(new CatIce(newXPos, newYPos));
          coins -= iceCost;
        }
        else if (towerType == 4) {
          towers.add(new CatEntropy(newXPos, newYPos));
          coins -= entropyCost;
        }
        meow.rewind();
        meow.play();
        camera.rewind();
        camera.play();
        coinSFX.rewind();
        coinSFX.play();
      }
    }
  }
  
  // This method will draw a copy of the tower's sprite while you're moving it
  void drawFakeTower() {
    //rectMode(CENTER);
    //noStroke();
    //fill(255);
    //rect(mouseX,mouseY,xSize,ySize);
    //rectMode(CORNER);
    imageMode(CENTER);
    tint(255,255,255,100);
    image(towerIconSprites.get(towerType - 1), mouseX, mouseY);
    noTint();
    imageMode(CORNER);
  }
  
  void draw() {
    //super.draw();
    imageMode(CENTER);
    if (!canBuy(towerType)) tint(255,100,100,100);
    image(towerIconSprites.get(towerType - 1), x, y);
    noTint();
    imageMode(CORNER);
    textAlign(CENTER,CENTER);
    fill(255);
    text("$" + getCost(towerType), x - 4, y + 30);
    textAlign(LEFT,TOP);
    
    // Show tower description
    if (hovering && hoveringTower == this) {
      fill(255);
      textAlign(LEFT,TOP);
      text(towerDesc.get(towerType - 1), 435, 370);
    }
  }
}

void mouseDragged() {
  dragging = true;
  // If nothing is being held and player is hovering over a tower, grab it
  if (heldIcon == null && hoveringButton == hoveringTower && canBuy(hoveringTower.towerType) && base.hp > 0) {
    heldIcon = hoveringTower;
  }
}

void mouseReleased() {
  dragging = false;
}

boolean canBuy(int towerType) {
  if (towerType == 1 && coins >= fireCost) return true;
  else if (towerType == 2 && coins >= lightningCost) return true;
  else if (towerType == 3 && coins >= iceCost) return true;
  else if (towerType == 4 && coins >= entropyCost) return true;
  return false;
}

int getCost(int towerType) {
  if (towerType == 1) return fireCost;
  else if (towerType == 2) return lightningCost;
  else if (towerType == 3) return iceCost;
  else return entropyCost;
}
