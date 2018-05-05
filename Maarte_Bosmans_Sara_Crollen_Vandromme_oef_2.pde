import controlP5.*;                                                                  //uit syllabus

import peasy.*;                                                                      //uit syllabus
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

PeasyCam camera;
ControlP5 control;

Road road;
Park park;

int numberOfTrees;
int numberOfBuildings;
int numberOfCitizens;

PFont f;              
PImage img;

ArrayList<Building>buildings;
ArrayList<Citizen>citizens;
ArrayList<Tree>trees;

boolean touching;

PVector bui;



  void setup() {

    size(1200, 800, P3D);
    smooth(8);

  
    numberOfTrees=15;
    numberOfBuildings=15;
    numberOfCitizens=50;
  
    img = loadImage("boom.png");                                                     //uit syllabus
    
    f = createFont("courier", 14, true);                                             //uit Nature of code
  
    camera = new PeasyCam(this, 1000);                                               //gebaseerd op oefenzitting 4
    camera.setMinimumDistance(500);
    camera.setMaximumDistance(2000);
  
    road = new Road(1000, 1000, 0);
    park = new Park(200, 200, 0);
  
    setupBuildings();
    setupCitizen();
    setupTrees();
  
    control = new ControlP5(this);
    setupGUI();
  }




  void draw() {
    
    background(255);  
    randomSeed(0);
    
    if ( mouseY < 60 ) {                                                            //uit oefenzitting 4
      camera.setActive( false );
    } 
    else {
      camera.setActive( true );
    }
  
    road.render();
    park.render();
  
  
    for ( Citizen c : citizens) {              
  
      c.applyBehaviors(citizens);                    
      c.update();
      c.render();
      c.checkBuildings(c);
      c.checkPark(c);
    }
  
  
    for (Building b : buildings) {                                               //gebaseerd op hoorcollege 6          

      b.checkPark();
      b.render();
    }
  
  
    for (Tree t : trees) {
      
      t.render();
    }
    
    renderGUI();
  } 
  
  void keyPressed() {     //uit Syllabus
    
    if (key=='s') {
      saveFrame("image/my-drawing-#####.png");      
      println("frame saved");
    }
  
    if (key=='t' || key == 'T') {
      setupTrees();
    }
    
    if(key =='b' || key =='b') {
      setupBuildings();
      setupCitizen();
    } 
  }