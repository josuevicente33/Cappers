// menu screen class

class SelectionScreen {
  PImage backgroundImage;
  PFont titleFont; 
  PFont optionFont; 
  
  SelectionScreen() {
    backgroundImage = loadImage("../Assets/Maps/Park_Map.jpeg");  
  }
  SelectionScreen(int selection) {
    if(selection == 1){
      backgroundImage = loadImage("../Assets/Maps/City_Map.jpeg");
    }
    else{
      backgroundImage = loadImage("../Assets/Maps/Park_Map.jpeg");
    }
  }

  void display() {
      image(backgroundImage,0,0,1280,720); 
  }
}
