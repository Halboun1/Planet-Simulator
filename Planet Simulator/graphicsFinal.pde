/* //<>//
 * PROJECT              :        Graphics and Design Final Porject
 * FILE NAME            :        graphicsFinal.pde
 * DEVELOPER            :        MOHAMED HALBOUNI
 * DATE                 :        2021-12-16
 * FILE DESCRIPTION     :        This file contains the main methods for the sketch to work.
*/




import processing.sound.*;
import g4p_controls.*;
import interfascia.*;

SoundFile file;

//GLOBAL VARIABLES//
float randomStarX;
float randomStarY;
boolean running = false;
int GUIWidth = 700/2;
int GUIHeight = 700/2;
color white = color(255);
color neonOrange = color(255, 95, 31);
color neonRed = color(230, 0, 0);
int maxStarsLimit;
ArrayList<Planets> planets;
PImage earth;
Planets newEarth;
boolean pause_play;


int[] starCordX;
int[] starCordY;
int initialStarsNumber = 100;

//GUI VARIABLES//
GUIController c;
IFButton submitStarsButton;
IFLookAndFeel defaultLook;
IFTextField howManyStars;
IFTextField addPlanets;
IFLabel numberOfStars;
IFLabel earthDist;
IFLabel earthRot;
IFLabel earthRev;
IFLabel moonDist;
IFLabel moonRot;
IFLabel addPlanet;
IFButton btnAddPlanets;
IFButton btnRemovePlanet;
IFButton btnScreenShot;
IFButton btnPausePlay;
IFButton btnReset;


//GUI SLIDERS//
GCustomSlider sdrDistFromSun;
GCustomSlider sdrEarthRotSpd;
GCustomSlider sdrEarthRevSpd;
GCustomSlider sdrMoonDistFromEarth;
GCustomSlider sdrMoonRotSpd;





void setup() {
  c = new GUIController (this);        //initialize the GUI controllers.
  file = new SoundFile(this, "spacesound-7547.mp3");       //adding the sound file
  file.loop();
  pause_play = true;
  background(255);
  size(700,1000,JAVA2D);

  
  planets = new ArrayList<Planets>();          //initializing and arrayList of type Planets that will store all new planets created.
  earth = loadImage("earth.png");
  imageMode(CENTER);
  
  
  createGUI();                //start displaying the GUI area
  createLabel();              //start displaying the label
  createSliders();            //display the sliders
  
  
  newEarth = new Planets(50, 255, 0.02, 0.01, 150, true, 50, 0.09, 10);            //create the earth

  createStars();            //create the stars.

}





 void draw() {
  drawSun();              //draw the sun
  showStars();            //show the stars
  
  
  newEarth.displayEarth();       //display the earth
  if(pause_play == true){        //if the game is on play state, then update the rotation of the earth
    newEarth.updateRotations();
  }
  
  for(Planets p:planets){        //display planets
       p.displayPlanet();
       if(pause_play == true){    //if the game is on play state, then update the rotation of the planets
          p.updateRotations();
       }   
      }
      
      
  fill(255);
  rect(0,700,700,300);
}




/*
 * FUNCTION NAME            :          void createStars()
 * PARAMETERS               :          NONE
 * DESCRIPTION              :          This function is to initialize the stars
 * RETURNS                  :          NONE
*/
void createStars(){
   starCordX = new int[initialStarsNumber];
   starCordY = new int[initialStarsNumber];
   for(int i = 0 ; i< initialStarsNumber ; i++){
     starCordX[i] = int(random(700));
     starCordY[i] = int(random(700));
   }
}


/*
 * FUNCTION NAME            :          void showStars()
 * PARAMETERS               :          NONE
 * DESCRIPTION              :          This function is to create and show stars
 * RETURNS                  :          NONE
*/
void showStars(){
  fill(255);
  for(int i = 0 ; i <initialStarsNumber ; i++){
    ellipse(starCordX[i],starCordY[i],3,3);
  }
}



/*
 * FUNCTION NAME            :          actionPerformed(GUIEvent e)
 * PARAMETERS               :          GUIEvent e
 * DESCRIPTION              :          This function is for the event handler for all of the buttons in the GUI
 * RETURNS                  :          NONE
*/
void actionPerformed(GUIEvent e) {
  
 if(e.getSource() == submitStarsButton) {
   int valueControl = int(howManyStars.getValue());
   if(valueControl < 0 || valueControl > 1000 || maxStarsLimit >= 1000){
     howManyStars.setValue("");
     print("too many stars!!");
   }
   else if(maxStarsLimit < 1000){
     maxStarsLimit += int(howManyStars.getValue());
     initialStarsNumber = valueControl;
     createStars();
     howManyStars.setValue("");
   }
   else{
     maxStarsLimit += int(howManyStars.getValue());
     initialStarsNumber = valueControl;
     createStars();
     howManyStars.setValue("");
   }
  }
  if(e.getSource() == btnAddPlanets){
    
    parseString(addPlanets.getValue());
    println(addPlanets.getValue());
    addPlanets.setValue("");
  }
  if(e.getSource() == btnRemovePlanet){
    if(planets.size() > 0){
      planets.remove(planets.size() - 1);
    }
  }
  if(e.getSource() == btnScreenShot){
    saveFrame();
  }
  if(e.getSource() == btnPausePlay)
  {
     if(pause_play == true){
       pause_play = false;
     }
     else{
       pause_play = true;
     }
  }
  if(e.getSource() == btnReset){
    setup();
  }
  
  if(e.getMessage().equals("Completed")){
     howManyStars.getValue(); 
  }
}





/*
 * FUNCTION NAME            :          void drawSun()
 * PARAMETERS               :          NONE
 * DESCRIPTION              :          This function is to create the sun in the middle of the canvas.
 * RETURNS                  :          NONE
*/
void drawSun(){
  fill(0);
  rect(0,0,700,700);
  fill(neonRed);
  ellipse(GUIWidth,GUIHeight,90,90);
  fill(neonOrange);
  ellipse(GUIWidth,GUIHeight,60,60);
  fill(white);
  ellipse(GUIWidth,GUIHeight,30,30);
  //filter(BLUR,9);                      *********************this filter function makes the program lag so much********************************
}




/*
 * FUNCTION NAME            :          public void handleSliderEvents(GValueControl slider, GEvent event)
 * PARAMETERS               :          GValueControl slider, GEvent event
 * DESCRIPTION              :          This function is for the event handler for all the sliders.
 * RETURNS                  :          NONE
*/
public void handleSliderEvents(GValueControl slider, GEvent event) { 
  if (slider ==sdrDistFromSun){
    newEarth.distFromSun = float(sdrDistFromSun.getValueS());
  }else if(slider == sdrEarthRotSpd){
   newEarth.rotationSpd = float(sdrEarthRotSpd.getValueS());
  }else if(slider == sdrEarthRevSpd){
    newEarth.revolvingSpd = float(sdrEarthRevSpd.getValueS());
  }else if(slider == sdrMoonDistFromEarth){
    newEarth.moonDistFromPlanet = float(sdrMoonDistFromEarth.getValueS());  
  }else if(slider == sdrMoonRotSpd){
   newEarth.moonRotationSpd = float(sdrMoonRotSpd.getValueS());
  }
  
}
