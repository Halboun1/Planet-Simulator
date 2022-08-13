/*
 * PROJECT              :        Graphics and Design Final Porject
 * FILE NAME            :        graphicsFinal.pde
 * DEVELOPER            :        MOHAMED HALBOUNI
 * DATE                 :        2021-12-16
 * FILE DESCRIPTION     :        This file contains the class for creating the planets.
 *                               as well as method to update the rotation of the planet and the earth
 *                               and also show earth and planets.
*/




class Planets{
  
  //class Data members
  float size;
  color colour;
  float rotationSpd;
  float revolvingSpd;
  float distFromSun;
  boolean addMoon;
  float moonDistFromPlanet;
  float moonRotationSpd;
  float moonSize;
  float rotationAngle;
  float angle1;
  float angle2;

  
  
  Planets(float aSize, color aColour, float aRotationSpd, float aRevolvingSpd, float aDistFromSun, boolean aAddMoon, float aMoonDistFromPlanet, float aMoonRotationSpd, float aMoonSize)
  {
    size = aSize;
    colour = aColour;
    rotationSpd = aRotationSpd;
    revolvingSpd = aRevolvingSpd;
    distFromSun = aDistFromSun;
    addMoon = aAddMoon;
    moonDistFromPlanet = aMoonDistFromPlanet;
    moonRotationSpd = aMoonRotationSpd;
    moonSize = aMoonSize;
    
    //variable for rotation calculation.
    rotationAngle =  random(TWO_PI);
    angle1 = random(TWO_PI);
    angle2 = random(TWO_PI);
  }
  
  
  
/*
 * FUNCTION NAME            :          displayEarth()
 * PARAMETERS               :          NONE
 * DESCRIPTION              :          This function is for displaying the earth.
 * RETURNS                  :          NONE
*/
  void displayEarth(){
    pushMatrix();
    float cordX = sin(angle1)*distFromSun;
    float cordY = cos(angle1)*distFromSun;
    translate(350+cordX,350+cordY);
    rotate(rotationAngle);
    image(earth,0,0,size,size);
    if(addMoon == true)
    {
      float moonX = sin(angle2)*moonDistFromPlanet;
      float moonY = cos(angle2)*moonDistFromPlanet;
      circle(moonX,moonY,moonSize);
    }
    popMatrix();
  }
  
  
  /*
 * FUNCTION NAME            :          void displayPlanet()
 * PARAMETERS               :          NONE
 * DESCRIPTION              :          This function is for displaying the planets.
 * RETURNS                  :          NONE
*/
  void displayPlanet(){
    pushMatrix();
    float cordX = sin(angle1)*distFromSun;
    float cordY = cos(angle1)*distFromSun;
    translate(350+cordX,350+cordY);
    rotate(rotationAngle);
    fill(colour);
    ellipse(0,0,size,size);
    if(addMoon == true)
    {
      float moonX = sin(angle2)*moonDistFromPlanet;
      float moonY = cos(angle2)*moonDistFromPlanet;
      circle(moonX,moonY,moonSize);
    }
    
    popMatrix();
  }




/*
 * FUNCTION NAME            :          updateRotations()
 * PARAMETERS               :          NONE
 * DESCRIPTION              :          This function is to continuasly keep update the state of the rotation and speed
 * RETURNS                  :          NONE
*/
void updateRotations(){
  angle1 += rotationSpd;
    rotationAngle += revolvingSpd;
    angle2 += moonRotationSpd; 
  }
}
