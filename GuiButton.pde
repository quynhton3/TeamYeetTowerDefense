GuiButton hoveringIcon;

// This class creates a gui button
class GuiButton {
  
  float x, y, xSize, ySize;
  boolean hovering = false;
  
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
    fill(hovering ? 100 : 0);
    rect(x,y,xSize,ySize);
  }
  
  // Check if the player is hoving on this icon
  void checkHover() {
    float xHalf = xSize / 2;
    float yHalf = ySize / 2;
    if (mouseX > this.x - xHalf
      && mouseX < this.x + yHalf
      && mouseY > this.y - yHalf
      && mouseY < this.y + yHalf) {
      hoveringIcon = this;
      hovering = true;
    }
    else {
      if (hoveringIcon == this) {
        hoveringIcon = null;
        hovering = false;
      }
    }
  }
}

// This class creates a tower icon that can be dragged onto the screen
class TowerIcon extends GuiButton {
  TowerIcon(float x, float y, float xSize, float ySize) {
    super(x,y,xSize,ySize);
  }
}
