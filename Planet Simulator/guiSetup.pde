/*
 * PROJECT              :        Graphics and Design Final Porject
 * FILE NAME            :        graphicsFinal.pde
 * DEVELOPER            :        MOHAMED HALBOUNI
 * DATE                 :        2021-12-16
 * FILE DESCRIPTION     :        This file contains all the necessary elements to create the GUI
 *                               added buttons exctracted from g4p library
 *                               added textArea and label exctracted from interfascia library
*/








/*
 * FUNCTION NAME            :          void createGUI()
 * PARAMETERS               :          NONE
 * DESCRIPTION              :          This function is to add all the buttons to the GUI area
 * RETURNS                  :          NONE
*/
void createGUI(){
 
  submitStarsButton = new IFButton ("Submit", 190, 710, 100, 20);              //initialization of submit button as well as location.
  submitStarsButton.addActionListener(this);
  defaultLook = new IFLookAndFeel(this,IFLookAndFeel.DEFAULT);
  defaultLook.baseColor = color(255);
  defaultLook.highlightColor = color(155);
  defaultLook.activeColor = color(155);
  howManyStars = new IFTextField("Text Field", 30,710,150);
  howManyStars.setWidth(150);
  howManyStars.setHeight(20);
  howManyStars.addActionListener(this);
  c.add(howManyStars);
  
  addPlanets = new IFTextField("Text Field",30,960,300);
  addPlanets.setHeight(20);
  addPlanets.addActionListener(this);
  c.add(addPlanets);
  
  btnAddPlanets = new IFButton("Add",350,960,50,20);
  btnAddPlanets.addActionListener(this);
  
  btnRemovePlanet = new IFButton("Remove Planet",410,960,100,20);
  btnRemovePlanet.addActionListener(this);
  
  btnScreenShot = new IFButton("ScreenShot",520,960,70,20);
  btnScreenShot.addActionListener(this);
  
  btnPausePlay = new IFButton("Pause/Play",600,960,70,20);
  btnPausePlay.addActionListener(this);
  
  btnReset = new IFButton("Reset",300,710,60,20);
  btnReset.addActionListener(this);
  
  
  defaultLook.borderColor = color(0);
  c.setLookAndFeel(defaultLook);
  c.add(submitStarsButton);
  c.add(btnAddPlanets);
  c.add(btnRemovePlanet);
  c.add(btnScreenShot);
  c.add(btnPausePlay);
  c.add(btnReset);
}




/*
 * FUNCTION NAME            :          createLabel()
 * PARAMETERS               :          NONE
 * DESCRIPTION              :          This function is to add all labels to the GUI area
 * RETURNS                  :          NONE
*/
void createLabel(){
  
  //label for earth distance from sun
  earthDist = new IFLabel("Text Field",35,740,150);
  earthDist.setLabel("Earth's Distance From Sun");
  
  //label for earth rotation speed
  earthRot = new IFLabel("Text Field",35,780,150);
  earthRot.setLabel("Earth's Rotation Speed");
  
  //label for earth revolving speed
  earthRev = new IFLabel("",35,820,150);
  earthRev.setLabel("Earth's Revolving Speed");
  
  //label for Moons distance from earth
  moonDist = new IFLabel("",35,860,150);
  moonDist.setLabel("Moon's Distance From Earth");
  
  //label for Moon Rotation speed
  moonRot = new IFLabel("",35,900,150);
  moonRot.setLabel("Moon's Rotation Speed");
  
  //label for adding planet
  addPlanet = new IFLabel("",35,940,150);
  addPlanet.setLabel("Adding a new planet");

  
  //adding lable to the GUI.
  c.add(earthDist);
  c.add(earthRot);
  c.add(earthRev);
  c.add(moonDist);
  c.add(moonRot);
  c.add(addPlanet);
}





/*
 * FUNCTION NAME            :          createSliders()
 * PARAMETERS               :          NONE
 * DESCRIPTION              :          This function is to add all sliders to the GUI area
 * RETURNS                  :          NONE
*/
void createSliders(){
  //earth distance from sun slider.
  sdrDistFromSun = new GCustomSlider(this, 30, 720, 200, 90, null);
  sdrDistFromSun.setLimits(0, 70.0f, 255.0f);
  sdrDistFromSun.setEasing(0);
  
  //earth rotation speed slider
  sdrEarthRotSpd = new GCustomSlider(this,30,760,200,90,null);
  sdrEarthRotSpd.setLimits(0, 0.01, 0.1);
  sdrEarthRotSpd.setEasing(0);
  
  //earth revolving speed slider
  sdrEarthRevSpd = new GCustomSlider(this,30,800,200,90,null);
  sdrEarthRevSpd.setLimits(0, 0.01, 0.1);
  sdrEarthRevSpd.setEasing(0);
  
  //moon distance from earth slider
  sdrMoonDistFromEarth = new GCustomSlider(this,30,840,200,90,null);
  sdrMoonDistFromEarth.setLimits(75.0f, 50.0f, 100.0f);
  sdrMoonDistFromEarth.setEasing(0);
  
  
  //moon rotation speed slider
  sdrMoonRotSpd = new GCustomSlider(this,30,880,200,90,null);
  sdrMoonRotSpd.setLimits(0, 0.05, 0.5);
  sdrMoonRotSpd.setEasing(0);
}
