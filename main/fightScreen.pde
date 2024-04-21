int count = 0; 
fighter[] cpus = new fighter[5];

class FightScreen {
  PImage fightMap;
  int xMax, yMax;
  boolean winner;
  fighter player1, player2;

  FightScreen(int mapSelect, fighter player1, fighter player2) {
    println("Map select: " + mapSelect);
    for(int i = 0; i < 5; i++) {
        cpus[i] = player2;
    }
    
    this.player1 = player1;
    this.player2 = cpus[0];
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
    text(("Score: " + count), 690, 50);
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
        count++;
        if(count >= cpus.length){
          handleEnd("Player 1");
        }
        else {
          player2 = cpus[count];
          player2.health = 100;
          player2.xPos = 500;
          //println("P2New:", player2.health);
        }
        //delay(100);
      }
      println("Score:", count);
    }
    
    if(player2.isAttacking) {

       if(Math.abs(player1.xPos-player2.xPos) <= 100 && Math.abs(player1.xPos-player2.xPos) <= 200) {
         if(player2.cooldown == 0){
           println(Math.abs(player1.xPos-player2.xPos));
           float attackType = random(-1, 1);
           if(attackType >= 0) {
             player1.health -= 5;  
           }
           else {
             player1.health -= 10;  
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
      if(player1.health <= 0){handleEnd("Player 2");}
    }
  }
  
  void handleEnd(String player) {
    print(player, "Wins!");
    winner = true;
  }

  void handleMousePressed() {
    // Handle mouse inputs specific to the fight screen, if any
  }
}
