class Shop 
{

  Shop()
  {
  }

  void update()
  {
  }

  void draw()
  {
    fill(240, 200);
    rect(150, 25, 625, 375); //Back of Window

    fill(25, 25, 255, 180);
    rect(150, 25, 625, 50); //Blue Top of Window 



    fill(0, 80);
    rect(170, 120, 385, 85); //Dividers: Cats
    rect(570, 120, 185, 85); //Dividers: Walls 
    rect(descriptionX, descriptionY, 385, 70); //Description Square



    fill(255, 100, 100, 200); //Red
    rect(675, 25, 100, 50); 
    isMouseOver(675, 25, 100, 50, 200); //Exit button 


    fill(100, 255, 100, 230); //Green
    rect(buyX, buyY, buyW, buyH); 
    isMouseOver(buyX, buyY, buyW, buyH, 200); //Buy Button 

    fill(255);
    textSize(30);
    textAlign(CENTER, CENTER);
    text("B U Y ", buyX + buyW/2, buyY + buyH/2 -5);
    textSize(12);


    //Buttons of Cat Towers & Logs ///////////////////////////////////////////////////////////////////////////////////////////////
    //Change Description 
    fill(255);
    textAlign(BOTTOM, LEFT);
    if (isMouseOver(175, 125, 75, 75, 200)) { //Fire 
      fill(255);
      text("Is able to deal an AOE around the cat with flames ", descriptionX + 10, descriptionY + 20);
    }
    if (isMouseOver(275, 125, 75, 75, 200)) { //Lightning
      text("Can shoot lightning that bounces deal damage to surrounding", descriptionX + 10, descriptionY + 20);
      text("enemies", descriptionX + 10, descriptionY + 40);
    }
    if (isMouseOver(375, 125, 75, 75, 200)) { //Ice
      text("Can throw icicle projectiles that pierces through enemies.", descriptionX + 10, descriptionY + 20);
    }
    if (isMouseOver(475, 125, 75, 75, 200)) { //Entrophy
      text("Attack 2 random enemies with 2 straight shots", descriptionX + 10, descriptionY + 20);
    }
    if (isMouseOver(575, 125, 75, 75, 200)) { //Logs
      text("Can take up 1 spaces to block enemies from passing through.", descriptionX + 10, descriptionY + 20);
    }

    if (isMouseOver(675, 125, 75, 75, 200)) { //2Logs
      text("Can take up 2 spaces to block enemies from passing through.", descriptionX + 10, descriptionY + 20);
    }




    fill(0, 255); //Text//////////////////////////////////
    textAlign(CENTER, CENTER);

    text("Towers", 200, 110);
    text("Walls", 600, 110);

    text("Fire Cat", 175 + (35), 225);
    text("Lightning Cat", 275 + (35), 225);
    text("Ice Cat", 375 + (35), 225);
    text("Entrophy Cat", 475 + (35), 225);

    text("Rock", 575 + 35, 225);
    text("Log", 675 + 35, 225);



  }
}
