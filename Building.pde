class Building {

  PVector centerOfBuilding;

  float width;
  float height;
  float depth;

  float minimumWidth = 40;
  float maximumWidth = 60;
  float minimumHeight = 60;
  float maximumHeight = 80;
  float minimumDepth = 80;
  float maximumDepth = 100;

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
    setcenterOfBuilding();
    setColor();
  }

  void setDimensionsOfBuilding() {
    width = random(minimumWidth, maximumWidth);
    height = random(minimumHeight, maximumHeight);
    depth = random(minimumDepth, maximumDepth);
  }

  void setcenterOfBuilding() {
    while (overlapWithPark()) {
      centerOfBuilding = road.getRandomLocation(width, height);                                                    //gebaseerd op oefenzitting 4
      calculateBoundaries();
    }
  }

  void overlapWithPark() {                                                                      //gebaseerd op hoorcollege 6
    return (park.isInside(minX, minY)||park.isInside(minX, maxY)||park.isInside(maxX, minY)||park.isInside(minX, minY));
  }

  void calculateBoundaries() {                                                             //gebaseerd op oefenzitting 4
    minX = centerOfBuilding.x - width/2;
    maxX = centerOfBuilding.x + width/2;
    minY = centerOfBuilding.y - height/2;
    maxY = centerOfBuilding.y + height/2;
    minZ = centerOfBuilding.z - depth/2;
    maxZ = centerOfBuilding.z + depth/2;
  }


  boolean checkInside(Citizen citizen) {                                                         //gebaseerd op oefenzitting 4
    
    citizenInBuilding = false; 
   
    if (citizen.location.x > minX && citizen.location.x < maxX &&
      citizen.location.y > minY && citizen.location.y < maxY &&
      citizen.location.z > minZ && citizen.location.z < maxZ) {
      
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
      
      float distance = dist(this.centerOfBuilding.x, this.centerOfBuilding.y, newBuilding.centerOfBuilding.x, newBuilding.centerOfBuilding.y); //formule uit Nature of code
      
      if (distance < height) {
        
        touching = true;
      } 
      
      else {
        touching = false;
      }
    }
    
    return touching;
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
        
        centerOfBuilding = road.getRandomLocation(width, height);
        
        calculateBoundaries();
      }
    }


    fill(c);
    stroke(s);
    strokeWeight(1);
    pushMatrix();                        //gebaseerd op hoorcollege 7 

    translate(centerOfBuilding.x, centerOfBuilding.y, depth/2);
    box(width, height, depth);
    popMatrix();
  }
}