class FightScreen {
  PImage fightMap;
  fighter player1, player2;

  FightScreen(int mapSelect, fighter player1, fighter player2) {
    this.player1 = player1;
    this.player2 = player2;
    if (mapSelect == 1) {
      fightMap = loadImage("../Assets/Maps/City_Map.jpeg");
    } else {
      fightMap = loadImage("../Assets/Maps/Park_Map.jpeg");

    }
  }

  void display() {
    background(fightMap);
    player1.display();
    player2.display();
  }

  void updateFight() {
    player1.updatePosition();
    player2.updatePosition();
    // Additional logic such as checking for collisions
  }

  void handleMousePressed() {
    // Handle mouse inputs specific to the fight screen, if any
  }
}
