class MainHUD 
{



  int coinX = 30, coinY = 20;

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


    //isMouseOver(30, 380, 150, 30, 200); //Shop button 

    //Main HUD///////////////////////////////////////////////////////////////////////////////////////////////
    fill(0);
    rect(0, 0, 900, 30); //top Backgroud Black

    fill(255, 90);
    textSize(18);
    text("$ :" + coins + " ", coinX, coinY);
    textSize(12);


    fill(255);
    textAlign(TOP, LEFT);
    text("P L A Y", playX + 10, playY + 20);
    if (isMouseOver(720, 380, 150, 30, 200)) { //Play button 


      // PUT SPAWN ENEMIES CODE @Mikey
    }

    fill(100, 255, 100, 80); //Green
    rect(shopX, shopY, shopW, shopH); //Shop Button bg
    isMouseOver(shopX, shopY, shopW, shopH, 200); //Shop button Hover
    fill(100, 200, 100);
    fill(255);
    text("S H O P", shopX +10, shopY +20);



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
