// menu screen class

class SelectionScreen {
  PImage backgroundImage;
  PFont titleFont; 
  PFont optionFont; 
  
  PImage parkMap; 
  PImage cityMap; 
  
  boolean mapSelect;
  boolean charSelect; 
  
  int mapOption; 
  int charOption; 
 
  SelectionScreen() {
    backgroundImage = loadImage("../Assets/Maps/Park_Map.jpeg");  
    parkMap = loadImage("../Assets/Maps/Park_Map_Small.jpeg");
    cityMap = loadImage("../Assets/Maps/City_Map_Small.jpeg");
    
    mapSelect = false; 
    charSelect = false; 
    
    mapOption = 0; 
    charOption = 0; 
  }
  
  SelectionScreen(int selection) {
    if(selection == 1){
      backgroundImage = loadImage("../Assets/Maps/City_Map.jpeg");
    }
    else{
      backgroundImage = loadImage("../Assets/Maps/Park_Map.jpeg");
    }
    parkMap = loadImage("../Assets/Maps/Park_Map_Small.jpeg");
    cityMap = loadImage("../Assets/Maps/City_Map_Small.jpeg");
    
    mapSelect = false; 
    charSelect = false; 
    
    mapOption = 0; 
    charOption = 0; 
  }
  
  boolean isSelectionComplete() {
    return mapSelect && charSelect;
  }


  void display() {
      image(backgroundImage,0,0,1280,720); 
      
      ellipseMode(CORNER);
      circle(243,158,150);
      circle(834,158,150);
      
      rectMode(CORNER); 
      fill(255); 
      rect(123,436,397,220);
      rect(133,444,378,200); 
      image(parkMap,133,444,378,200);
      
      rect(714,436,397,220);
      rect(724,444,378,200);
      image(cityMap,724,444,378,200);   
  }
  
  void handleMousePressed() {
    // Generic method to handle all clickable areas
    chooseCharacter();
    chooseMap();
  }
  
  int chooseCharacter() {
    if (dist(mouseX, mouseY, 243, 158) < 150 && mousePressed) {
      println("Character 1!");
      charSelect = true;
      charOption = 1;
      return 1;
    }
    if (dist(mouseX, mouseY, 834, 158) < 150 && mousePressed) {
      println("Character 2");
      charSelect = true;
      charOption = 2;
      return 2;
    }
    return 0;
   }

  int chooseMap() {
    if (mouseX > 133 && mouseX < 511 && mouseY > 444 && mouseY < 644) {
      println("Park Map");
      mapSelect = true;
      mapOption = 1;
      return 1;
    }
    if (mouseX > 724 && mouseX < 1102 && mouseY > 444 && mouseY < 644) {
      println("City Map");
      mapSelect = true;
      mapOption = 2;
      return 2;
    }
    return 0;
  }

    
    
    int currentStateUpdate(int currentState) {
      if (mapOption != 0 && charOption != 0) {
        return 3;
      }

      return currentState;
    }
      
}
