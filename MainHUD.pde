class MainHUD 
{



  int coinX = 30, coinY = 13;

  MainHUD()
  {
  }

  void update()
  {
  }

  void draw()
  {
    if (shopOpen) {
    }



    //Main HUD///////////////////////////////////////////////////////////////////////////////////////////////
    fill(0);
    rect(0, 0, 1000, 30); //top Backgroud Black Bar

    fill(255, 110);
    textSize(18);
    textAlign(LEFT, CENTER);
    text("$ : " + coins + " ", coinX, coinY);


    //text("S C O R E : " + score, 400, height -40);
    textSize(14);
    text("S C O R E : " + score, 780, coinY +1);

    textSize(12);
    //fill(255);
    //textAlign(TOP, LEFT);
    //text("P L A Y", playX + 10, playY + 20);
    //if (isMouseOver(720, 380, 150, 30, 200)) { //Play button 


    // PUT SPAWN ENEMIES CODE @Mikey
    //}

    //textAlign(TOP, LEFT);
    //fill(100, 255, 100, 80); //Green
    //rect(shopX, shopY, shopW, shopH, 2); //Shop Button bg
    //isMouseOver(shopX, shopY, shopW, shopH, 200); //Shop button Hover
    //fill(100, 200, 100);
    //fill(255);
    //text(" S H O P", shopX +10, shopY +20);



    //isMouseOver(720, 380, 150, 30, 200); //Play Button Hover

    //Selected Item/////////////////////////////////////////////////////////////////////////
    if (mouseClicked  && isMouseOver(shopX, shopY, shopW, shopH, 255)) {  
      shopOpen = true;
    }
  }


  //void mousePressed() {

  //  if (isMouseOver(shopX, shopY, shopW, shopH, 0)) { //Clicked on Shop
  //    fill(255);

  //    print("OK");

  //    //OPENS SHOP
  //    shopOpen = true;
  //  }
  //}
}
