  void setupCitizen() {                                                          //gebaseerd op oefenzitting 4
  
    citizens = new ArrayList<Citizen>();
  
    for (int i =0; i<numberOfCitizens; i++) {
      
      citizens.add(new Citizen(random(road.minX, road.minX+10), random(-10, 10)));
    }
  }
  
  void setupBuildings() {
    
    buildings = new ArrayList<Building>();
    
      for (int i =0; i<numberOfBuildings; i++) {
        
        buildings.add(new Building());
      }
    
  }
  
  void setupTrees() {
    
    trees = new ArrayList<Tree>();
  
    for ( int i=0; i<numberOfTrees; i++) {
      
      trees.add(new Tree());
    }
  }