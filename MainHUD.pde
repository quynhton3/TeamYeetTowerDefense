class MainHUD 
{
  int descriptionX = 170;
  int descriptionY = 300;


  MainHUD()
  {
  }

  void update()
  {
  }

  void draw()
  {


    isMouseOver(30, 380, 150, 30, 255); //Shop button 

    isMouseOver(570, 300, 185, 70, 0); //Play Button 
    //Main HUD///////////////////////////////////////////////////////////////////////////////////////////////
    fill(255);
    textAlign(TOP, LEFT);

    if (isMouseOver(720, 380, 150, 30, 0)) { //Play button 
      fill(255, 20, 20);
      text("P L A Y", descriptionX + 10, descriptionY + 20);
      // PUT SPAWN CODE
    }



    if (isMouseOver(30, 380, 150, 30, 0)) { //Shop
      text("S H O P", descriptionX + 10, descriptionY + 20);

      //OPENS SHOP
    }



    fill(0, 100); //Text
    textAlign(CENTER, CENTER);
    text("Fire Tower", 175, 225);
    text("Lightning Tower", 275, 225);
    text("Ice Tower", 375, 225);
    text("Entrophy Tower", 475, 225);
  }

  void mousePressed() {
  }
}
