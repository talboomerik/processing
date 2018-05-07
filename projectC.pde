import controlP5.*;                                                                  //uit syllabus 

import peasy.*;                                                                      //uit syllabus, camera
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

PeasyCam camera;                                                                     //camera
ControlP5 control;                                                                   //controller

World world;                                                                         //wereld en park worden gedeclareerd 
Park park;

PFont f;                                        

boolean touching;

PVector bui;

void setup() {

  size(1200, 800, P3D);                                                              //grootte van het scherm
  smooth(8);

  f = createFont("courier", 14, true);                                               //uit Nature of code; bepaalt het lettertype, lettergrootte

                                                                                     //zorgt ervoor dat je enkel kan draaien rond de z-as
  
  world = new World(1000, 1000, 0);                                                  //wereld en park worden geinitialiseerd met de gewenste afmetingen 
  park = new Park(200, 200, 1);

  setupBuildings();                                                                  //deze drie methodes worden aangeroepen uit functions
  setupCitizen();                                                                    //zorgen ervoor dat het gewenste aantal gebouwen, burgers en bomen worden aangemaakt
  setupTrees();
  
  setupCamera();                                                                     //stelt de camera in 
  
  control = new ControlP5(this);                                                     //controller wordt geinitialiseerd
  setupGUI();
}

void draw() {

  background(255);  
  randomSeed(0);

  if ( mouseY < 60 ) {                                                            //uit oefenzitting 4; zorgt ervoor dat men de sliders juist kan besturen 
    camera.setActive( false );
  } else {
    camera.setActive( true );
  }

  world.render();      

  renderGUI();
} 