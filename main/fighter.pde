// fighter class
int direction = 1; 
class fighter {
  String name;
  int xPos, yPos;
  int health;
  PImage fighterImage;  // Image to represent the fighter
  char upKey, downKey, leftKey, rightKey; // Keys for controlling the fighter
  boolean facingRight = true;
  boolean isAttacking = false;
  boolean player;
  int cooldown;
  HashMap<String, PImage> images = new HashMap<>();
  String charName;
  String charAttackName;

  
  float yVel = 0;
  float gravity = 1; 
  
  void Heavy(Runnable function) {
    function.run();
  }
  void Light(Runnable function) {
    function.run();
  }
  
  fighter(String name, int xPos, int yPos, char up, char down, char left, char right, boolean player) {
    if (name == "CPU") {
      charName = "2nd_Character-idle";
      charAttackName = "2nd_Charcter Attack";
      images.put("rightWalk", loadImage("../Assets/Characters/"+ charName +".png"));
      images.put("leftWalk", loadImage("../Assets/Characters/"+ charName + "_left.png"));
      images.put("rightAttack", loadImage("../Assets/Characters/"+ charAttackName + ".png"));
      images.put("leftAttack", loadImage("../Assets/Characters/"+ charAttackName + "_left.png"));
    }
    else {
      charName = "Mateo_Charcter";
      charAttackName = "Mateo_Character_Attack";
      images.put("rightWalk", loadImage("../Assets/Characters/"+ charName +".png"));
      images.put("leftWalk", loadImage("../Assets/Characters/"+ charName + "_left.png"));
      images.put("rightAttack", loadImage("../Assets/Characters/"+ charAttackName + ".png"));
      images.put("leftAttack", loadImage("../Assets/Characters/"+ charAttackName + "_left.png"));
    }
    
    fighterImage = images.get("rightWalk");
    
    this.name = name;
    this.xPos = xPos;
    this.yPos = yPos;
    this.health = 100;
    this.upKey = up;
    this.downKey = down;
    this.leftKey = left;
    this.rightKey = right;
    this.player = player;
    this.cooldown = 0;
  }
  
void display() {
    image(fighterImage, xPos, yPos, 50, 50);
}
      
  void updatePosition(int yMax) {
    yVel += gravity;
    yPos += yVel;
    if(health == 0){return;}

    // Check for ground collision
    if (yPos > yMax) {
      yPos = yMax;
      yVel = 0;
    }

    // movement
    if(player){
      if (keyPressed) {
        if (key == upKey && yPos == yMax) {
          yVel = -10; // This value controls the jump strength
        }
        
        if (key == leftKey) {
          facingRight = false;
          xPos -= 5;
          fighterImage = images.get("leftWalk");
        }
        if (key == rightKey) {
          facingRight = true;
          fighterImage = images.get("rightWalk");
          xPos += 5;
        }
        if (key == 'c' || key == 'v' || key == 'C' || key == 'V') {
          isAttacking = true;
          if (facingRight)
              fighterImage = images.get("rightAttack");
          else 
              fighterImage = images.get("leftAttack");
        }
      }
      else {
           if (facingRight)
              fighterImage = images.get("rightWalk");
          else 
              fighterImage = images.get("leftWalk");
       }
    }
    else {
      xPos += direction;
      if(xPos >= 900 || xPos <= 100) {direction*=-1; facingRight = !facingRight;}
      //println("x", xPos);
     //println("dir", direction);
      float attackChance = random(4);
      if(attackChance<=3){isAttacking = true;} //75% chance of cpu attacking when in range
    }
    
    // limit where characters can go
    yPos = constrain(yPos, 0, yMax);
    xPos = constrain(xPos, 0, 1280);
  }
  


}
