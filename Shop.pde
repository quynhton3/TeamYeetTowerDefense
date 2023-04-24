class Shop 
{
  int clickedOn;


  PImage cat1, cat2, cat3, cat4;
  Shop()
  {  
    cat1 = loadImage("tower1.png");
    cat2 = loadImage("tower2.png");
    cat3 = loadImage("tower3.png");
    cat4 = loadImage("tower4.png");
  }

  void update()
  {
  }

  void draw()
  {
    fill(200, 230);
    rect(150, 25, 625, 375, 2); //Back of Window

    fill(25, 25, 255, 180);
    rect(150, 25, 625, 50, 0); //Blue Top of Window 



    fill(170, 200);
    //rect(170, 120, 385, 82); //Dividers: Cats

    rect(170, 120, 85, 85, 2);
    rect(270, 120, 85, 85, 2);
    rect(370, 120, 85, 85, 2);
    rect(470, 120, 85, 85, 2);
    //rect(570, 120, 185, 82); //Dividers: Walls 

    fill(120, 100);
    rect(descriptionX, descriptionY, 385, 70, 2); //Description Square

    fill(255, 100, 100, 200); //Red
    rect(675, 25, 100, 50, 0); 
    isMouseOver(675, 25, 100, 50, 200); //Exit button 

    textSize(30);
    fill(255, 200); 
    text("X", 675 + 40, 25 + 35);


    fill(100, 255, 100, 230); //Green
    fill(#5A9D79); //#5A9D79
    rect(buyX, buyY, buyW, buyH, 2); 
    isMouseOver(buyX, buyY, buyW, buyH, 200); //Buy Button 

    fill(255, 200);
    textSize(30);
    textAlign(CENTER, CENTER);
    text("B U Y ", buyX + buyW/2, buyY + buyH/2 -5);
    //textSize(28);
    //text("S H O P ", 220, 45);
    textSize(12);

    //Buttons of Cat Towers & Logs ///////////////////////////////////////////////////////////////////////////////////////////////
    //Change Description 
    fill(255);
    textAlign(BOTTOM, LEFT);
    if (isMouseOver(175, 125, 75, 75, 200)) { //Fire 
      fill(255);
      //text("Is able to deal an AOE around the cat with flames ", descriptionX + 10, descriptionY + 20);
      text("Does like 10 damage per shot. Likes hanging with Brandon in ", descriptionX + 10, descriptionY + 20);
      text("IRC 104. Appreciates Brandon's work and looks up to", descriptionX + 10, descriptionY + 40);
      text("his soundboard. Big fan of Mike.", descriptionX + 10, descriptionY + 60);
    }
    if (isMouseOver(275, 125, 75, 75, 200)) { //Lightning
      //text("Can shoot lightning that bounces deal damage to surrounding", descriptionX + 10, descriptionY + 20);
      //text("enemies", descriptionX + 10, descriptionY + 40);
      text("Can do 20 damage to an enemy per hit! Favorite person ", descriptionX + 10, descriptionY + 20);
      text("is CodeGods Jennyboo and Jay <344. Thinks James is funny.", descriptionX + 10, descriptionY + 40);
    }
    if (isMouseOver(375, 125, 75, 75, 200)) { //Ice
      //text("Can throw icicle projectiles that pierces through enemies.", descriptionX + 10, descriptionY + 20);
      text("Able to do up to 30 damage to an enemy!! Enjoys the Khelben.", descriptionX + 10, descriptionY + 20);
      text("Thinks Khelben has a big head. Is v fond of Mr.Ty & amused by ", descriptionX + 10, descriptionY + 40);
      text("his comments.", descriptionX + 10, descriptionY + 60);
    }
    if (isMouseOver(475, 125, 75, 75, 200)) { //Entrophy
      //text("Attack 2 random enemies with 2 straight shots", descriptionX + 10, descriptionY + 20);
      text("A strong boi, ez 1 taps!!!! Works out and likes long walks on  ", descriptionX + 10, descriptionY + 20);
      text("the beach. Works out with Fill, the Vaarun, and Seabasses!", descriptionX + 10, descriptionY + 40);
    }
    //if (isMouseOver(575, 125, 75, 75, 200)) { //Logs
    //  text("Can take up 1 spaces to block enemies from passing through.", descriptionX + 10, descriptionY + 20);
    //}

    //if (isMouseOver(675, 125, 75, 75, 200)) { //2Logs
    //  text("Can take up 2 spaces to block enemies from passing through.", descriptionX + 10, descriptionY + 20);
    //}




    //Not enough monies = has red box /////////////////

    if (coins < fireCost) {
      fill( 255, 0, 0, 15);
      rect(175, 125, 75, 75, 2);
    } 

    if (coins < lightningCost) {
      fill( 255, 0, 0, 15);
      rect(275, 125, 75, 75, 2);
    } 

    if (coins < iceCost) {
      fill( 255, 0, 0, 15);
      rect(375, 125, 75, 75, 2);
    } 

    if (coins < entropyCost) {
      fill( 255, 0, 0, 15);
      rect(475, 125, 75, 75, 2);
    } 



    //Selects = has green box ///////////////////////////////////////
    fill(0, 255, 0, 10); //green
    if (hasFire == true) {
      rect(175, 125, 75, 75, 2);
    }
    if (hasLightning == true) {
      rect(275, 125, 75, 75, 2);
    }
    if (hasIce == true) {
      rect(375, 125, 75, 75, 2);
    }
    if (hasEntrophy == true) {
      rect(475, 125, 75, 75, 2);
    }


    //CAT PHOTOSS ///////////////////////////////////////
    cat1.resize(60, 60);  
    cat2.resize(60, 60);  
    cat3.resize(60, 60);  
    cat4.resize(60, 60);  

    tint(255, 40);  // Display at half opacity
    image(cat1, 185, 130 + 5);
    image(cat2, 285, 130 +5);
    image(cat3, 385, 130 + 5);
    image(cat4, 485, 130 + 5);
    tint(255, 255);  // Display at full opacity







    fill(100, 200); //Text////////////////////////////////////////////
    textAlign(CENTER, CENTER);

    //text("Towers", 200, 110);
    //text("Walls", 600, 110);


    text("Fire Cat", 175 + (35), 225);
    text("Lightning Cat", 275 + (35), 225);
    text("Ice Cat", 375 + (35), 225);
    text("Entrophy Cat", 475 + (35), 225);

    // PRICES
    fill(255, 240);
    textAlign(RIGHT, CENTER);
    text("$900", 175 + (35) + 30, 225 - 40);
    text("$1200", 275 + (35) + 30, 225 - 40);
    text("$600", 375 + (35) + 30, 225 - 40);
    text("$400", 475 + (35) + 30, 225 - 40);

    //text("$900", 175 + (35) + 10, 225 +20);
    //text("$1200", 275 + (35) + 20, 225 + 25);
    //text("$600", 375 + (35) +20, 225 + 25);
    //text("$400", 475 + (35) +10, 225 + 25);


    //    text("Rock", 575 + 35, 222);
    //    text("Log", 675 + 35, 222);
  }
}
