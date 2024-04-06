// fight screen class

class fightScreen {
  String name;
  String fileName;
  PImage background;
  
  fightScreen(String name, String fileName) {
    this.name = name;
    this.fileName = fileName;
    this.background = loadImage(fileName);
  }
  
  void openScreen() {
      image(background, 0, 0);
  }
}
