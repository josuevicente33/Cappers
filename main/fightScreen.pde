// fight screen class

class fightScreen {
  String name;
  String fileName;
  PImage background;
  
  fightScreen() {
    this.name = name;
    this.fileName = fileName;
    background = loadImage("../Assests/Maps/Park_Map.jpeg");
  }
    fightScreen(String name, String fileName) {
    this.name = name;
    this.fileName = fileName;
    background = loadImage(fileName);
  }
  
  void display() {
      image(background,0,0,1280,720);
  }
}
