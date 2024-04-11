// fight screen class

class FightScreen {
  String name;
  String fileName;
  PImage background;
  
  FightScreen() {
    this.name = name;
    this.fileName = fileName;
    background = loadImage("../Assets/Maps/Park_Map.jpeg");
  }
    FightScreen(String name, String fileName) {
    this.name = name;
    this.fileName = fileName;
    background = loadImage(fileName);
  }
  
  void display() {
      image(background,0,0,1280,720);
  }
}
