


import processing.sound.*;
SoundFile sound;
SoundFile attack; 

MainScreen mainscreen;
SelectionScreen selectionscreen; 
FightScreen fightscreen; 
match currentMatch;
fighter fighter1;
fighter fighter2;

int map_select = 0; 
int player1_char = 0; 
int player2_select = 0; 
int numRounds = 2;


enum GameState {
  MAIN_SCREEN,
  EXIT_SELECTION,
  SINGLE_PLAYER_SELECTION,
  FIGHT_SCREEN,
  END_SCREEN
}

GameState currentState = GameState.MAIN_SCREEN;

void setup() {
  size(1280, 720);  
  mainscreen = new MainScreen(); 
  selectionscreen = new SelectionScreen(); 
  sound = new SoundFile(this, "../Assets/Sound Effects/main_music.mp3");
  sound.play();
  
  attack = new SoundFile(this, "../Assets/Sound Effects/Hurt.wav");

  currentMatch = new match(null, null, null, null);
  
}

void draw() {
  background(0);
  
  switch(currentState) {
    case MAIN_SCREEN:
      mainscreen.display();
      
      if (mousePressed) {
        int selectedOption = mainscreen.OptionPressed();
        selectionscreen = new SelectionScreen(selectedOption);
        currentState = (selectedOption == 1) ? GameState.EXIT_SELECTION : GameState.SINGLE_PLAYER_SELECTION;
      }
      
      break;
      
    case EXIT_SELECTION:
      if (mousePressed) {
          exit(); 
        }
    break;
    
    
    case SINGLE_PLAYER_SELECTION:
      selectionscreen.display();
      
      if (mousePressed) {
        player1_char = selectionscreen.chooseCharacter();
        map_select = selectionscreen.chooseMap();
      }



      if (selectionscreen.isSelectionComplete()) {
        
      if (player1_char == 1) {
          fighter1 = new fighter("Mateo", 100, 500, 'w', 's', 'a', 'd', true); // WASD for player one
          fighter2 = new fighter("CPUCat",  200, 500, 'i', 'k', 'j', 'l', false); // IJKL for player two
        
       }
       if (player1_char == 2) {
          fighter1 = new fighter("Cat", 100, 500, 'w', 's', 'a', 'd', true); // WASD for player one
          fighter2 = new fighter("CPUMateo",  200, 500, 'i', 'k', 'j', 'l', false); // IJKL for player two
       }
   

        currentState = GameState.FIGHT_SCREEN;
        fightscreen = new FightScreen(map_select, fighter1, fighter2, numRounds);
       // currentMatch = new match("single", fightscreen, fighter1, fighter2);
      }
    break;
      
    case FIGHT_SCREEN:
    fightscreen.display();
    fightscreen.updateFight();
    if(keyPressed){
      if(key == 'c'){
          attack.play(); 
      }
    }
    //if(fightscreen.winner) {
      //handle what to do after fight is over
    //}
      fightscreen.display();
      fightscreen.updateFight();
      currentState = fightscreen.updateState(currentState);
    break;
    
    case END_SCREEN:
    // restart button, quit etc
    // here need to dislay winning stats, not sure what though
    fightscreen.displayEndScreen();
    if(keyPressed){
      if(key == 'x'){
          currentState = GameState.MAIN_SCREEN;
          break;
      }
    }
  
  }
}

//void mousePressed() {
//  if (currentState == GameState.MAIN_SCREEN) {
//    int selectedOption = mainscreen.OptionPressed();
//    selectionscreen = new SelectionScreen(selectedOption);
//    currentState = (selectedOption == 1) ? GameState.PVP_SELECTION : GameState.SINGLE_PLAYER_SELECTION;
//  } else if (currentState == GameState.PVP_SELECTION || currentState == GameState.SINGLE_PLAYER_SELECTION) {
//    selectionscreen.handleMousePressed();
//    if (selectionscreen.isSelectionComplete()) {
//      currentState = GameState.FIGHT_SCREEN;
//      currentMatch = new match("single", fightscreen, fighter1, null); // Setup match
//    }
//  } else if (currentState == GameState.FIGHT_SCREEN) {
//    // Handle fight screen mouse interactions
//  }
//}
