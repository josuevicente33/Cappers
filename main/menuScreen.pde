// menu screen class

class menuScreen {
  boolean menuActive;
  
  menuScreen() {
    menuActive = true;  
  }

  void openScreen() {
    background(200, 100, 0);
    textSize(100);
    text("GAME TITLE", 400, 100);
    
    rect(390, 400, 500, 75, 28);
    rect(390, 500, 500, 75, 28);
    
    textSize(50);
    fill(0, 408, 612);  
    text("Single Player", 510, 450);
    text("Multi Player", 510, 550);
    noFill();
  }
}
