void setupGUI() {                        //gebaseerd op oefenzitting 4
  
  control = new ControlP5(this);
  control.setAutoDraw(false);
  
  control.addSlider("roadWidth")
         .setRange(600, 1200)
         .setValue(1000)
         .setSize(100,20)
         .setPosition(20,20);
         
  control.addSlider("roadHeight")
         .setRange(600, 1200)
         .setValue(1000)
         .setSize(100, 20)
         .setPosition(200, 20);
         
  control.addSlider("roadDepth")
         .setRange(5, 20)
         .setValue(10)
         .setSize(100,20)
         .setPosition(400, 20);
         
  control.addSlider("numberOfTrees")
         .setRange(0,20)
         .setValue(15)
         .setSize(100,20)
         .setPosition(600,20);
         
  control.addSlider("numberOfBuildings")
         .setRange(5,30)
         .setValue(15)
         .setSize(100,20)
         .setPosition(800,20);
         
  control.addSlider("numberOfCitizens")
         .setRange(1,300)
         .setValue(100)
         .setSize(100,20)
         .setPosition(1000,20);
         
  control.addTextfield("PRESS T TO APPLY SLIDER TREES - PRESS B TO APPLY SLIDER BUILDINGS AND SLIDER CITIZENS")     //gebaseerd op 
         .setPosition(260, 60)
         .setSize(1, 1)
         .setFont(f)
         .setColor(255);
         
}

  void renderGUI() {
    
    camera.beginHUD();
    fill(0,128);
    noStroke();
    rect(0,0, width, 100);
    control.draw();
    camera.endHUD();
  }
  
  
  void roadWidth(float value) {             //gebaseerd op oefenzitting 4
 
    road.setWidth( value );
    setupCitizen();
    setupBuildings();
    setupTrees();
  }
  
  
  
  void roadHeight(float value){
    
    road.setHeight( value );
    setupCitizen();
    setupBuildings();
    setupTrees();

  }

         



         