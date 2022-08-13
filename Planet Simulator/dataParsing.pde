/*
 * PROJECT              :        Graphics and Design Final Porject
 * FILE NAME            :        graphicsFinal.pde
 * DEVELOPER            :        MOHAMED HALBOUNI
 * DATE                 :        2021-12-16
 * FILE DESCRIPTION     :        This file contains the logic of parsing the user input for adding a planet
 *                               if the user input is then valid, it will create the planet.
*/






/*
 * FUNCTION NAME            :          parseString(String aBuff)
 * PARAMETERS               :          NONE
 * DESCRIPTION              :          This function is to get the user input from the text area and
 *                                     pass them to the creation of the planet class.
 * RETURNS                  :          NONE
*/
void parseString(String aBuff){
  //temp data to store what is in the string.
  float size;
  float rotationSpd;
  float revolvingSpd;
  float distFromSun;
  boolean addMoon;
  float moonDistFromPlanet;
  float moonRotationSpd;
  float moonSize;

  
  
  
  color planetColor = color(0,0,255); //default value of blue

  String[] temp = split(aBuff,',');
  if(temp.length == 9){
    size = int(temp[0]);
    if(temp[1].equals("white")){
      planetColor = color(255,255,255);
    }
    if(temp[1].equals("red")){
      planetColor = color(255,0,0);
    }
    if(temp[1].equals("blue")){
      planetColor = color(0,0,255);
    }
    if(temp[1].equals("yellow")){
      planetColor = color(255,255,0);
    }
    
    rotationSpd = float(temp[2]);
    revolvingSpd = float(temp[3]);
    distFromSun = float(temp[4]);
    if(temp[5].equals("true")){
      addMoon = true;
    }
    else{
      addMoon = false;
    }
    moonDistFromPlanet = float(temp[6]);
    moonRotationSpd = float(temp[7]);
    moonSize = int(temp[8]);
    Planets newPlanet = new Planets(size,planetColor,rotationSpd,revolvingSpd,distFromSun,addMoon,moonDistFromPlanet,moonRotationSpd,moonSize);
    planets.add(newPlanet);
    //clear the the text field for another user input.
    addPlanets.setValue("");
    
  }
  else{
   println("Not enough arguments to Create a Planet"); 
  }
  
}
