// fighter class

class fighter {
  String name;
  int xPos, yPos;
  int health;
  PImage fighterImage;  // Image to represent the fighter
  char upKey, downKey, leftKey, rightKey; // Keys for controlling the fighter
  
  void Heavy(Runnable function) {
    function.run();
  }
  void Light(Runnable function) {
    function.run();
  }
  
  fighter(String name, int xPos, int yPos, char up, char down, char left, char right) {
    this.name = name;
    this.xPos = xPos;
    this.yPos = yPos;
    this.health = 100;
    this.upKey = up;
    this.downKey = down;
    this.leftKey = left;
    this.rightKey = right;
    fighterImage = loadImage("../Assets/Characters/Mateo_Charcter.png");
  }
  
  void display() {
    image(fighterImage, xPos, yPos, 50, 50); // Adjust size as needed
  }
  
  void updatePosition() {
    if (keyPressed) {
      if (key == upKey) yPos -= 5;  // Move up
      if (key == downKey) yPos += 5;  // Move down
      if (key == leftKey) xPos -= 5;  // Move left
      if (key == rightKey) xPos += 5;  // Move right
    }
  }
}
