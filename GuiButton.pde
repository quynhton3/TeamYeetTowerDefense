// This tab has most of the code for gui classes and tower dragging

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
  TowerIcon(float x, float y, float xSize, float ySize, int towerType) {
    super(x,y,xSize,ySize);
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
        
        x = newXPos;
        y = newYPos;
        
        // Code to make a new tower goes here!
      }
    }
  }
  
  // This method will draw a copy of the tower's sprite while you're moving it
  void drawFakeTower() {
    rectMode(CENTER);
    noStroke();
    fill(255);
    rect(mouseX,mouseY,xSize,ySize);
  }
}

void mouseDragged() {
  dragging = true;
  // If nothing is being held and player is hovering over a tower, grab it
  if (heldIcon == null && hoveringButton == hoveringTower) {
    heldIcon = hoveringTower;
  }
}

void mouseReleased() {
  dragging = false;
}
