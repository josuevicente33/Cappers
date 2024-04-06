
MainScreen mainscreen;

int current_state = 0; 

void setup() {
  size(1280, 720,P3D);  
  mainscreen = new MainScreen(); 
}

void draw() {
  background(200, 100, 0);
  
  switch(current_state){
    case 0: 
      mainscreen.display(); 
      current_state = mainscreen.OptionPressed(); 
      //print(PFont.list());
      break; 
   case 1:
     //character screen for PVP player
     println("PVP Selected");
     break; 
   case 2:
     //charcter screen for Single Player
     println("Single Selected");

     break; 
  }
  
  //textSize(100);
  //text("GAME TITLE", 400, 100);
  
  //rect(390, 400, 500, 75, 28);
  //rect(390, 500, 500, 75, 28);
  
  //textSize(50);
  //fill(0, 408, 612);  
  //text("Single Player", 510, 450);
  //text("Multi Player", 510, 550);
  //noFill();
}

void mousePressed() {
  // Check if single player button is clicked
  if(mouseX >= 390 && mouseX <= 890) {
    if(mouseY >= 400 && mouseY <= 475) {
      //Handle single player button clicked
      println("SINGLE PLAYER", mouseX, mouseY);
    }
  }
  
  if(mouseX >= 390 && mouseX <= 890) {
    if(mouseY >= 500 && mouseY <= 575) {
      //Handle single player button clicked
      println("MULTI PLAYER", mouseX, mouseY);
    }
  }
}
