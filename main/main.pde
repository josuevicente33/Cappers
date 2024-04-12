
MainScreen mainscreen;
SelectionScreen selectionscreen; 
FightScreen fightscreen; 

int current_state = 0; 
int map_select = 0; 
int player1_char = 0; 
int player2_select = 0; 

void setup() {
  size(1280, 720,P3D);  
  mainscreen = new MainScreen(); 
  selectionscreen = new SelectionScreen(); 
  fightscreen = new FightScreen();
}

void draw() {
  background(200, 100, 0);
  
  switch(current_state){
    case 0: 
      mainscreen.display(); 
      current_state = mainscreen.OptionPressed(); 
      selectionscreen = new SelectionScreen(current_state);
      //print(PFont.list());
      break; 
   case 1:
     //character screen for PVP player
     selectionscreen.display(); 
     selectionscreen.chooseCharacter(current_state); 
     selectionscreen.chooseMap(current_state); 
     //println("PVP Selected");
     break; 
   case 2:
     //charcter screen for Single Player
     selectionscreen.display(); 
     selectionscreen.chooseCharacter(current_state); 
     selectionscreen.chooseMap(current_state); 
     //println("Single Selected");

     break; 
  }
}
