import java.util.Stack;
import java.util.HashMap;
// fighter class
HashMap<Character, Integer> keys = new HashMap<Character, Integer>();
  
class fighter {
  String name;
  int xPos, yPos;
  int health;
  PImage fighterImage;  // Image to represent the fighter
  char upKey, downKey, leftKey, rightKey; // Keys for controlling the fighter
  //Stack<Character> keys = new Stack<>();

 
  
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
    keys.put('a', 0);
    keys.put('w', 0);
    keys.put('s', 0);
    keys.put('d', 0);
  }
  
  void display() {
    image(fighterImage, xPos, yPos, 50, 50); // Adjust size as needed
  }
  
  void updatePosition() {
    
      if (keyPressed) {
        keys.put(key, 1);
        //println("P", key);
        if (keys.get('w') == 1) yPos -= 5;  // Move up
        //println(yPos);
        if (keys.get('s') == 1) yPos += 5;  // Move down
        if (keys.get('a') == 1) xPos -= 5;  // Move left
        if (keys.get('d') == 1) xPos += 5;  // Move right
    }
    keys.put(rKey, 0);
  }
  
  //void keyPressed() {
    //keys.put(key, 1);
    //updatePosition();
  //}
}

void keyReleased() {
    println('w', keys.get('w'));
    println('s', keys.get('s'));
    println('a', keys.get('a'));
    println('d', keys.get('d'));
    char rKey = key;
    keys.put(rKey, 0);
    println('w', keys.get('w'));
    println('s', keys.get('s'));
    println('a', keys.get('a'));
    println('d', keys.get('d'));
}
  
