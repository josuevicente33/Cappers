// Initializations

menuScreen menu;
boolean choiceScreen;
boolean fightScreen;
match newMatch;

fighter player1;

void setup() {
  size(1280, 720);
  menu = new menuScreen();
  newMatch = new match();
  choiceScreen = false;
  fightScreen = false;
  player1 = new fighter("test", 0, 0);
}

void draw() {
  if (menu.menuActive) {
    menu.openScreen();
  }
  else {
    print("HERE");
    newMatch.runMatch();
  }
  
}

void mousePressed() {
  print("HH!!!");
  if(menu.menuActive){
    // Check if single player button is clicked
    if(mouseX >= 390 && mouseX <= 890) {
      if(mouseY >= 400 && mouseY <= 475) {
        //Handle single player button clicked
        println("SINGLE PLAYER", mouseX, mouseY);
        //for testing
        fightScreen f = new fightScreen("1", "./../assests/maps/City_Map.jpeg");
        fighter f1 = new fighter("f1", 10, 300);
        fighter f2 = new fighter("f2", 200, 300);
        newMatch.matchType = "f";
        newMatch.location = f;
        newMatch.fighter1 = f1;
        newMatch.fighter2 = f2;
        //
        menu.menuActive = false;
        println("m", menu.menuActive);
        playType = 1;
      }
    }
    
    if(mouseX >= 390 && mouseX <= 890) {
      if(mouseY >= 500 && mouseY <= 575) {
        //Handle single player button clicked
        println("MULTI PLAYER", mouseX, mouseY);
        menu.menuActive = false;
        playType = 2;
      }
    }
}
}
