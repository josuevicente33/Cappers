class FightScreen {
  PImage fightMap;
  int xMax, yMax;
  boolean winner;
  fighter player1, player2;
  int roundNumber, requiredRounds;

  FightScreen(int mapSelect, fighter player1, fighter player2) {
    println("Map select: " + mapSelect);
    
    // for round based
    this.requiredRounds = 2  ;
    this.roundNumber = 0;

    
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
    
    textSize(20);
    text("Player 1:", 100, 25);
    fill(250, 10, 10);
    for(int i = 0; i < player1.health; i++) {
      rect((190 + (i*3)), 17, 3, 15);  
    }
    for(int i = 0; i < player2.health; i++) {
      rect((190 + (i*3)), 42, 3, 15);  
    }
    noFill();
    text("Player 2:", 100, 50);
    
    fill(10, 15, 10);
    text(("Score: " + roundNumber), 690, 50);
  }

  void updateFight() {
    player1.updatePosition(yMax);
    player2.updatePosition(yMax);
    
  // doing anythign else  
    if(Math.abs(player1.xPos-player2.xPos) <= 200 && Math.abs(player1.xPos-player2.xPos) <= 200){player1.cooldown--;}
    if(player1.isAttacking) {
       if(Math.abs(player1.xPos-player2.xPos) <= 200 && Math.abs(player1.xPos-player2.xPos) <= 200) {
         if(player1.cooldown <= 0){
           if(key == 'c' || key == 'C'){
             player2.health -= 5;
           }
           else if(key == 'V' || key == 'v') {
             player2.health -= 10;
           }
           println("P2 health:", player2.health);
           player1.cooldown = 50;
         }
         else {
           player1.cooldown--;
         }
        // println("P1 cooldown", player1.cooldown);
      }
      player1.isAttacking = false;
      if(player2.health <= 0){
        roundNumber++;
        if(roundNumber >= requiredRounds){
          handleEnd("Player 1");
          player1.wins++;
        }
        else {
          //player2 = cpus[count];
          player2.health = 100;
          player2.xPos = 700;
          //println("P2New:", player2.health);
        }
        //delay(100);
      }
    }
    
    if(player2.isAttacking) {

       if(Math.abs(player1.xPos-player2.xPos) <= 100 && Math.abs(player1.xPos-player2.xPos) <= 200) {
         if(player2.cooldown == 0){
           println(Math.abs(player1.xPos-player2.xPos));
           float attackType = random(-1, 1);
           if(attackType >= 0) {
             player1.health -= 1;  
           }
           else {
             player1.health -= 2;  
           }
          // println("P1 health:", player1.health);
           player2.cooldown = 50;
         }
         else {
           player2.cooldown--;  
         }
         //println("P2 cooldown", player2.cooldown);
      }
      player2.isAttacking = false;    
      if(player1.health <= 0){
        handleEnd("Player 2");
        player2.wins++;
    }
    }
  }
  
  void handleEnd(String player) {
    this.roundNumber++;
    println(player);
    
    if (roundNumber < requiredRounds) {
      player1.xPos = 100;
      player1.yPos = 500;
      
      player2.xPos = 700;
      player2.yPos = 500;
    }
  }
  
  // this might be able to be placed in its own class
  void displayEndScreen() {

    PImage currMap = loadImage("../Assets/Screens/bACKGROUND.jpeg");
    background(currMap);
    textSize(32); 
    fill(255); 
    if(player1.wins > player2.wins){
      text("Player 1 wins: " + player1.wins +" | PRESS X TO RESTART", width/2, height*3/4);
    }else if (player2.wins > player1.wins) {
      text("Player 2 wins: " + player2.wins+" | PRESS X TO RESTART", width/2, height*3/4);
    }else if (player1.wins == player2.wins) {
      text("Draw: Player 1: " + player1.wins + " | Player 2: " + player2.wins+" | PRESS X TO RESTART", width/2, height*3/4);
    }
     
  }
  
  
  GameState updateState(GameState currentState) {
    // currently the only way to change to end scren is by the rounds being over.
    if (roundNumber >= requiredRounds) { return GameState.END_SCREEN; }
    
    return currentState;
  }
  
}
