
MainScreen mainscreen;
fightScreen fightscreen; 

int current_state = 0; 

void setup() {
  size(1280, 720,P3D);  
  mainscreen = new MainScreen(); 
  fightscreen = new fightScreen();
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
     fightscreen.display(); 
     println("PVP Selected");
     break; 
   case 2:
     //charcter screen for Single Player
     println("Single Selected");

     break; 
  }
}
