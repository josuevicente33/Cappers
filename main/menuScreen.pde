class MainScreen{
  PImage backgroundImage;
  PFont titleFont; 
  PFont optionFont; 
  int buttonX;
  int buttonWidth;
  int buttonHeight;
  
  int singleY;
  int pvpY;
  
  MainScreen(){
    backgroundImage = loadImage("../Assets/Maps/Park_Map.jpeg"); 
    
    titleFont = createFont("../Assets/Fonts/Sixtyfour-Regular.ttf",100);
    optionFont = createFont("../Assets/Fonts/Sixtyfour-Regular.ttf",40); 
    
    buttonX = width/2; 
    buttonWidth = 300;
    buttonHeight = 50; 
    
    singleY = height/2 - 100; 
    pvpY = height/2 ;
  }
   void display(){
     background(255);
     image(backgroundImage,0,0,1280,720); 
     
     textMode(CENTER); 
     textAlign(CENTER,CENTER); 
     fill(255);
     textFont(titleFont);
     text("CAPPERS",width/2, 100); 
     
     textFont(optionFont); 
     rectMode(CENTER); 
     fill(76,170,82);
     noStroke();
     rect(buttonX,singleY,buttonWidth,buttonHeight,10);
     fill(255);
     text("PVP", buttonX,singleY);
     
     rectMode(CENTER); 
     fill(76,170,82);
     noStroke();
     rect(buttonX,pvpY,buttonWidth,buttonHeight,10);
     fill(255);
     text("SINGLE", buttonX,pvpY);
     
   }
   
   int OptionPressed(){
    if(mousePressed){
      if(mouseX >= 490 && mouseX <= 790 && mouseY >= 235 && mouseY <= 280) {
        println("Clicked on the PVP!");
        return 1; 
       }
      else if(mouseX >= 490 && mouseX <= 790 && mouseY >= 335 && mouseY <= 385) {
        println("Clicked on the Single!");
        return 2; 
       }
     println(mouseX,mouseY); 
    }
    return 0; 
   }
}
