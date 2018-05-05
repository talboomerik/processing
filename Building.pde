class Building {

  PVector location;

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

  color fillColor;
  color borderColor;

  Building() {
    setDimensionsOfBuilding();
    setLocation();
    calculateBoundaries();
    checkPark();
    setColor();
  }

  void setDimensionsOfBuilding() {
    width = random(minimumX, maximumX);
    height = random(minimumY, maximumY);
    depth = random(minimumZ, maximumZ);
  }

  void setLocation() {
    location = road.getRandomLocation(width, height);                                                    //gebaseerd op oefenzitting 4

  }

  void calculateBoundaries() {                                                             //gebaseerd op oefenzitting 4
    minX = location.x - width/2;
    maxX = location.x + width/2;
    minY = location.y - height/2;
    maxY = location.y + height/2;
    minZ = location.z - depth/2;
    maxZ = location.z + depth/2;
  }


  boolean checkInside(Citizen c) {                                                         //gebaseerd op oefenzitting 4
    
    citizenInBuilding = false; 
   
    if (c.location.x > minX && c.location.x < maxX &&
      c.location.y > minY && c.location.y < maxY &&
      c.location.z > minZ && c.location.z < maxZ) {
      
        citizenInBuilding = true;
    }
    
    return citizenInBuilding;
  }



  void setColor() {                                                                       //inspiratie uit inleiding Nature of code
    
    float r = random(1);
    
    if (r<0.4) {
      
      fillColor = #BABAC4;
      borderColor = #7E797A;
    } 
    
    else if (r<0.6) {
      
      fillColor = #ff0000;
      borderColor = #902931;
    } 
    
    else { 
      
      fillColor = #2C20E3;
      borderColor = #3A3676;
    }
  }



  boolean checkTouching(Building building) {
    
    touching = false;

    if (building != this) {
      
      Building newBuilding = building;
      
      float distance = dist(this.location.x, this.location.y, newBuilding.location.x, newBuilding.location.y); //formule uit Nature of code
      
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
      
      location = road.getRandomLocation(width, height);
      
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
        
        location = road.getRandomLocation(width, height);
        
        calculateBoundaries();
      }
    }


    fill(c);
    stroke(s);
    strokeWeight(1);
    pushMatrix();                        //gebaseerd op hoorcollege 7 

    translate(location.x, location.y, depth/2);
    box(width, height, depth);
    popMatrix();
  }
}