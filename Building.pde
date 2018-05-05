class Building {

  PVector loc;

  float width;
  float height;
  float depth;

  float minimumX = 40;
  float maximumX = 60;
  float minimumY = 60;
  float maximumY = 80;
  float minimumZ = 80;
  float maximumZ = 100;

  float minX;
  float maxX;
  float minY;
  float maxY;
  float minZ;
  float maxZ;

  boolean citizenInBuilding;

  color c;
  color s;

  Building() {

    width = random(minimumX, maximumX);
    height = random(minimumY, maximumY);
    depth = random(minimumZ, maximumZ);

    loc = road.getRandomLocation(width, height);                                                    //gebaseerd op oefenzitting 4

    calculateBoundaries();
    checkPark();
    setColor();
  }


  void calculateBoundaries() {                                                             //gebaseerd op oefenzitting 4
    
    minX = loc.x - width/2;
    maxX = loc.x + width/2;
    minY = loc.y - height/2;
    maxY = loc.y + height/2;
    minZ = loc.z - depth/2;
    maxZ = loc.z + depth/2;
  }



  boolean checkInside(Citizen c) {                                                         //gebaseerd op oefenzitting 4
    
    citizenInBuilding = false; 
   
    if (c.loc.x > minX && c.loc.x < maxX &&
      c.loc.y > minY && c.loc.y < maxY &&
      c.loc.z > minZ && c.loc.z < maxZ) {
      
        citizenInBuilding = true;
    }
    
    return citizenInBuilding;
  }



  void setColor() {                                                                       //inspiratie uit inleiding Nature of code
    
    float r = random(1);
    
    if (r<0.4) {
      
      c = #BABAC4;
      s = #7E797A;
    } 
    
    else if (r<0.6) {
      
      c = #ff0000;
      s = #902931;
    } 
    
    else { 
      
      c = #2C20E3;
      s = #3A3676;
    }
  }



  boolean checkTouching(Building building) {
    
    touching = false;

    if (building != this) {
      
      Building newBuilding = building;
      
      float distance = dist(this.loc.x, this.loc.y, newBuilding.loc.x, newBuilding.loc.y); //formule uit Nature of code
      
      if (distance < height) {
        
        touching = true;
      } 
      
      else {
        touching = false;
      }
    }
    
    return touching;
  }




  void checkPark() {                                                                      //gebaseerd op hoorcollege 6
    
    while (park.isInside(minX, minY)||park.isInside(minX, maxY)||park.isInside(maxX, minY)||park.isInside(minX, minY)) {
      
      loc = road.getRandomLocation(width, height);
      
      calculateBoundaries();
    }
  }



  void render() {
    
    for (Citizen c : citizens) {
      
      if (checkInside(c)) {
        
        if (depth< 200) {
          
          depth +=0.04;
        } 
        
        else {
          
          depth= 200;
        }
      }
    }

    for (Building b : buildings) {
      
      if (checkTouching(b)) {
        
        loc = road.getRandomLocation(width, height);
        
        calculateBoundaries();
      }
    }


    fill(c);
    stroke(s);
    strokeWeight(1);
    pushMatrix();                        //gebaseerd op hoorcollege 7 

    translate(loc.x, loc.y, d/2);          
    box(width, height, depth);
    popMatrix();
  }
}