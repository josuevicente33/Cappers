
MainScreen mainscreen;
SelectionScreen selectionscreen; 
FightScreen fightscreen; 
match currentMatch;
fighter fighter1;
fighter fighter2;

int map_select = 0; 
int player1_char = 0; 
int player2_select = 0; 

enum GameState {
  MAIN_SCREEN,
  PVP_SELECTION,
  SINGLE_PLAYER_SELECTION,
  FIGHT_SCREEN
}

GameState currentState = GameState.MAIN_SCREEN;


void setup() {
  size(1280, 720);  
  mainscreen = new MainScreen(); 
  selectionscreen = new SelectionScreen(); 
  currentMatch = new match(null, null, null, null);
}

void draw() {
  background(200, 100, 0);
  
  switch(currentState) {
    case MAIN_SCREEN:
      mainscreen.display();
      
      if (mousePressed) {
        int selectedOption = mainscreen.OptionPressed();
        selectionscreen = new SelectionScreen(selectedOption);
        currentState = (selectedOption == 1) ? GameState.PVP_SELECTION : GameState.SINGLE_PLAYER_SELECTION;
      }
      
      break;
      
    case PVP_SELECTION:
      //if (mousePressed) {
      //    int selectedOption = mainscreen.OptionPressed();
      //    selectionscreen = new SelectionScreen(selectedOption);
      //    currentState = (selectedOption == 2) ? GameState.PVP_SELECTION : GameState.SINGLE_PLAYER_SELECTION;
      //  }
    break;
    
    
    case SINGLE_PLAYER_SELECTION:
      selectionscreen.display();
      
      if (mousePressed) {
        player1_char = selectionscreen.chooseCharacter();
        map_select = selectionscreen.chooseMap();
      }

      if (selectionscreen.isSelectionComplete()) {
        fighter1 = new fighter("Fighter1", 100, 500, 'w', 's', 'a', 'd', true); // WASD for player one
        fighter2 = new fighter("CPU", 200, 500, 'i', 'k', 'j', 'l', false); // IJKL for player two

        currentState = GameState.FIGHT_SCREEN;
        fightscreen = new FightScreen(map_select, fighter1, fighter2);
       // currentMatch = new match("single", fightscreen, fighter1, fighter2);
      }
    break;
      
    case FIGHT_SCREEN:
    fightscreen.display();
    fightscreen.updateFight();
    //if(fightscreen.winner) {
      //handle what to do after fight is over
    //}
    break;
  
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
