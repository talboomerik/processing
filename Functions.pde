ArrayList<Building>buildings;                                                   //ArryListen die het aantal gebouwen, burgers of bomen bevatten 
ArrayList<Citizen>citizens;
ArrayList<Tree>trees;

int numberOfTrees=15;                                                           //het aantal bomen, gebouwen en burgers 
int numberOfBuildings=15;
int numberOfCitizens=50;
int r;  
int desiredAttraction; 


void setupCitizen() {                                                          //gebaseerd op oefenzitting 4

  citizens = new ArrayList<Citizen>();  

  for (int i =0; i<numberOfCitizens; i++) {                                    //er wordt telkens een agent toegevoegd tot het gewenste aantal bereikt wordt 

    citizens.add(new Citizen(random(world.left, world.left+10), random(10)));
    //desiredAttraction = r*2;
    println(((i+1)/numberOfCitizens)*100+"% done");
  }
}

void setupBuildings() {                                                        //er wordt telkens een box toegevoegd tot het gewenste aantal bereikt wordt    

  buildings = new ArrayList<Building>();

  for (int i =0; i<numberOfBuildings; i++) {
    float r = random(1);
    if (r<0.4) {
      BlueBuilding bb = new BlueBuilding();
      buildings.add(bb);
    } else if (r<0.6) {
      RedBuilding rb= new RedBuilding();
      buildings.add(rb);
    } else {
      GreyBuilding gb = new GreyBuilding();
      buildings.add(gb);
    }
  }
}

void setupTrees() {                                                          //er wordt telkens een box toegevoegd tot het gewenste aantal bereikt wordt    

  trees = new ArrayList<Tree>();

  for ( int i=0; i<numberOfTrees; i++) {

    trees.add(new Tree());
  }
}

void setupCamera() {
  camera = new PeasyCam(this, 1000);                                         //gebaseerd op oefenzitting 4; camera wordt geinitialiseerd; het zoomen krijgt een minimum en maximum
  camera.setMinimumDistance(500);
  camera.setMaximumDistance(2000);

  camera.setRollRotationMode();  
  camera(0, 1000, 1000, 0, 0, 0, 0, 1, 0);  
  //het beeld dat je krijgt helt wat naar voor 
}