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
    fill(240);
    rect(150, 25, 625, 375); //Back of Window

    fill(25, 25, 255);
    rect(150, 25, 625, 50); //Blue Top of Window 


    fill(0, 80);
    rect(170, 120, 385, 85); //Dividers: Cats
    rect(570, 120, 185, 85); //Dividers: Walls 
    rect(descriptionX, descriptionY, 385, 70); //Description Square




    isMouseOver(570, 300, 185, 70); //Play Button 

    isMouseOver(675, 25, 100, 50); //Exit button 


    //Buttons of Cat Towers & Logs ///////////////////////////////////////////////////////////////////////////////////////////////
    //Change Description 
    fill(255);
    textAlign(TOP, LEFT);
    if (isMouseOver(175, 125, 75, 75)) { //Fire 
      fill(255);
      text("Is able to deal an AOE around the cat with flames ", descriptionX + 10, descriptionY + 20);
    }
    if (isMouseOver(275, 125, 75, 75)) { //Lightning
      text("Can shoot lightning that bounces deal damage to surrounding", descriptionX + 10, descriptionY + 20);
      text("enemies", descriptionX + 10, descriptionY + 40);
    }
    if (isMouseOver(375, 125, 75, 75)) { //Ice
      text("Can throw icicle projectiles that pierces through enemies.", descriptionX + 10, descriptionY + 20);
    }
    if (isMouseOver(475, 125, 75, 75)) { //Entrophy
      text("Attack 2 random enemies with 2 straight shots", descriptionX + 10, descriptionY + 20);
    }
    if (isMouseOver(575, 125, 75, 75)) { //Logs
      text("Can take up 1 spaces to block enemies from passing through.", descriptionX + 10, descriptionY + 20);
    }

    if (isMouseOver(675, 125, 75, 75)) { //2Logs
      text("Can take up 2 spaces to block enemies from passing through.", descriptionX + 10, descriptionY + 20);
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
