// fighter class

class fighter {
  String name;
  int xPos, yPos;
  int health;
  PImage fighterImage;  // Image to represent the fighter
  char upKey, downKey, leftKey, rightKey; // Keys for controlling the fighter
  boolean facingRight = true;
  boolean isAttacking = false;

  
  float yVel = 0;
  float gravity = 1; 
  
  void Heavy(Runnable function) {
    function.run();
  }
  void Light(Runnable function) {
    function.run();
  }
  
  fighter(String name, int xPos, int yPos, char up, char down, char left, char right) {
    if (name == "CPU") {
        fighterImage = loadImage("../Assets/Characters/2nd_Character-idle.png");
    }
    else {
        fighterImage = loadImage("../Assets/Characters/Mateo_Charcter.png");
    }
    
    this.name = name;
    this.xPos = xPos;
    this.yPos = yPos;
    this.health = 100;
    this.upKey = up;
    this.downKey = down;
    this.leftKey = left;
    this.rightKey = right;
  }
  
void display() {
    pushMatrix();
    translate(xPos + 25, yPos + 25);

    if (!facingRight) {
        scale(-1, 1);
    }

    image(fighterImage, -25, -25, 50, 50);
    popMatrix();
}
      
  void updatePosition(int yMax) {
    yVel += gravity;
    yPos += yVel;

    // Check for ground collision
    if (yPos > yMax) {
      yPos = yMax;
      yVel = 0;
    }

    // movement
    if (keyPressed) {
      if (key == upKey && yPos == yMax) {
        yVel = -10; // This value controls the jump strength
      }
      
      if (key == leftKey) {
        facingRight = false;
        xPos -= 5;
      }
      if (key == rightKey) {
        facingRight = true;
        xPos += 5;
      }
      if (key == 'c') {
        isAttacking = true;
      }
    }
    
    // limit where characters can go
    yPos = constrain(yPos, 0, yMax);
    xPos = constrain(xPos, 0, 1280);
  }
  


}
