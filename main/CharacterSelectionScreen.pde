// menu screen class

class SelectionScreen {
  PImage backgroundImage;
  PFont optionFont; 
  
  PImage parkMap; 
  PImage cityMap; 
  
  boolean mapSelect;
  boolean charSelect; 
  
  int mapOption; 
  int charOption; 
  
  PImage Character1; 
  PImage Character2; 
  
  int numRounds;
 
  SelectionScreen() {
    backgroundImage = loadImage("../Assets/Maps/Park_Map.jpeg");  
    parkMap = loadImage("../Assets/Maps/Park_Map_Small.jpeg");
    cityMap = loadImage("../Assets/Maps/City_Map_Small.jpeg");
    
    mapSelect = false; 
    charSelect = false; 
    
    mapOption = 0; 
    charOption = 0; 
    
    Character1 = loadImage("../Assets/Characters/Mateo_Charcter.png");
    Character2 = loadImage("../Assets/Characters/2nd_Character-idle.png");
    optionFont = createFont("../Assets/Fonts/Sixtyfour-Regular.ttf",40); 
    
    numRounds = 2;

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
    
    Character1 = loadImage("../Assets/Characters/Mateo_Charcter.png");
    Character2 = loadImage("../Assets/Characters/2nd_Character-idle.png");
    
    optionFont = createFont("../Assets/Fonts/Sixtyfour-Regular.ttf",40); 

  }
  
  boolean isSelectionComplete() {
    return mapSelect && charSelect;
  }

  void display() {
      image(backgroundImage,0,0,1280,720); 
      textFont(optionFont); 
      text("Choose character and map", width/2,100); 

      ellipseMode(CORNER);
      circle(243,158,150);
      image(Character1, 270,180,100,100);
      circle(834,158,150);
      image(Character2, 850,180,100,100);
      
      rectMode(CORNER); 
      fill(255); 
      rect(123,436,397,220);
      rect(133,444,378,200); 
      image(parkMap,133,444,378,200);
      
      rect(714,436,397,220);
      rect(724,444,378,200);
      image(cityMap,724,444,378,200);   
      
      rect(width/2-75,height/2-50,100,100);
      rect(width/2-150,height/2-25,50,50);
      rect(width/2+50,height/2-25,50,50);
      fill(250, 10, 10);
      text("Rounds", width/2-25, height/2-75);
      text(numRounds, width/2-25, height/2);
      text("+", width/2-125,height/2+3);
      text("-", width/2+75,height/2+3);
      fill(255); 
  }
  
  void handleMousePressed() {
    chooseCharacter();
    chooseMap();
    chooseRounds();
  }
  
  
  int chooseCharacter() {
    if (dist(mouseX, mouseY, 243, 158) < 150 && mousePressed) {
      println("Character 1! - Mateo");
      charSelect = true;
      charOption = 1;
      return 1;
    }
    if (dist(mouseX, mouseY, 834, 158) < 150 && mousePressed) {
      println("Character 2 - Cat");
      charSelect = true;
      charOption = 2;
      return 2;
    }
    return charOption;
   }


  int chooseMap() {
    
    if (mouseX > 133 && mouseX < 511 && mouseY > 444 && mouseY < 644) {
      println("Park Map");
      mapSelect = true;
      mapOption = 0;
    }
    if (mouseX > 724 && mouseX < 1102 && mouseY > 444 && mouseY < 644) {
      println("City Map");
      mapSelect = true;
      mapOption = 1;
    }
    
    return mapOption;
  }
  
  int chooseRounds() {
    if (mouseX > 450 && mouseX < 550 && mouseY > 300 && mouseY < 400) {
      if(numRounds<99){
        numRounds++;
        println("+");
      }
    }
    if (mouseX > 650 && mouseX < 700 && mouseY > 300 && mouseY < 400) {
      if(numRounds>-1){
        numRounds--;
        println("-");
      }
    }
    return numRounds;
  }
    
    
    int currentStateUpdate(int currentState) {
      if (isSelectionComplete()) {
        return 3;
      }

      return currentState;
    }
      
}

void mousePressed(){
     println("x", mouseX);
    println("y", mouseY); 
}
