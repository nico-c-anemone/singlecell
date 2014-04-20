// SingleCell
// Copyright (c) 2014 Nicholas Alcus
// see README.txt or SingleCell.txt for details about this software.
// It comes without any warranty, to the extent permitted 
// by applicable law.

// singlecell.pde
// file version: a0007
// Main single cell application


static final int WINDOW_WIDTH = 1280;
static final int WINDOW_HEIGHT = 720;
static final int FRAMERATE = 60;

boolean showLines;

NoiseCache noiseCache;
TextHandler textHandler;
Agent cell;
Timer timer;

void setup() {
  size (WINDOW_WIDTH, WINDOW_HEIGHT);
  frameRate (FRAMERATE);
  smooth();
  
  noiseCache = new NoiseCache();
  textHandler=new TextHandler();
  cell = new Cell();
  timer = new Timer();
  
  // default to not showing lines
  showLines=false;
}

void draw() {
  //iterate frames. the first frame that is actually rendered is frame 1.
  timer.newFrame();
  
  //grey background
  background (128); 
  
 // set cell goal to mouse cursor 
  cell.setGoal(mouseX, mouseY);
  
  // update cell math & AI
  cell.update();
  
  // render cell
  cell.display();
  
  // render title text
  textHandler.setTextToTitle();
  textHandler.shadowText("SingleCell",10,24); 
  textHandler.setTextToSubtitle();
  textHandler.shadowText("Copyright 2014 Nicholas Alcus",10,48);
  
  // render instructional text
  textHandler.setTextToDefault();
  textAlign(RIGHT);

    textHandler.shadowText( "Frame Time :"+(int)timer.getFrameTime()+"ms",
    WINDOW_WIDTH-10, WINDOW_HEIGHT-30);
  
  textHandler.shadowText( "Current goal :[" + mouseX + ", " + mouseY+"]",
    WINDOW_WIDTH-10, WINDOW_HEIGHT-10);

}

void keyPressed() {

  if (key == 'l' || key == 'L') {
    // toggle display of physics lines
    showLines=!showLines;
  }
}
