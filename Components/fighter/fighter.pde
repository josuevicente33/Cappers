// fighter class

class fighter {
  String name;
  int xPos;
  int yPos;
  
  void Heavy(Runnable function) {
    function.run();
  }
  void Light(Runnable function) {
    function.run();
  }
  
  fighter(String name, int xPos, int yPos) {
    
  }
}
