import java.util.Random;

class FightScreen {
  PImage fightMap;
  int xMax, yMax;
  boolean winner;
  fighter player1, player2;

  FightScreen(int mapSelect, fighter player1, fighter player2) {
    println("Map select: " + mapSelect);
    
    this.player1 = player1;
    this.player2 = player2;
    this.winner = false;
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
    
    if(player1.isAttacking) {
       if(Math.abs(player1.xPos-player2.xPos) <= 100 && Math.abs(player1.xPos-player2.xPos) <= 200) {
         if(key == 'c' || key == 'C'){
           player2.health -= 5;
         }
         else if(key == 'V' || key == 'v') {
           player2.health -= 10;
         }
         println("health:", player2.health);
      }
      player1.isAttacking = false;
      if(player2.health <= 0){handleEnd("Player 1");}
      
      delay(200);
    }
    /*
    if(player2.isAttacking) {
       if(Math.abs(player1.xPos-player2.xPos) <= 100 && Math.abs(player1.xPos-player2.xPos) <= 200) {
         float attackType = random(-1, 1);
         if(attackType >= 0) {
           player1.health -= 10;  
         }
         else {
           player1.health -= 5;  
         }
         println("health:", player1.health);
         delay(200);
      }
      player2.isAttacking = false;    
      if(player1.health <= 0){handleEnd("Player 2");}
    }
    */
  }
  
  void handleEnd(String player) {
    print(player, "Wins!");
    winner = true;
  }

  void handleMousePressed() {
    // Handle mouse inputs specific to the fight screen, if any
  }
}
