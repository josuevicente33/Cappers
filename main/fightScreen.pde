class FightScreen {
  PImage fightMap;
  int xMax, yMax;
  fighter player1, player2;

  FightScreen(int mapSelect, fighter player1, fighter player2) {
    println("Map select: " + mapSelect);
    
    this.player1 = player1;
    this.player2 = player2;
    if (mapSelect == 1) {
      fightMap = loadImage("../Assets/Maps/City_Map.jpeg");
      // set bounds for map here
      yMax = 600;
    } else {                                                                                 
      fightMap = loadImage("../Assets/Maps/Park_Map.jpeg");
      // set bounds for map right here.
      yMax = 510;
    }
  }

  void display() {
    background(fightMap);
    player1.display();
    player2.display();
  }

  void updateFight() {
    player1.updatePosition(yMax);
    player2.updatePosition(yMax);
    
  // doing anythign else  
    
  }

  void handleMousePressed() {
    // Handle mouse inputs specific to the fight screen, if any
  }
}
