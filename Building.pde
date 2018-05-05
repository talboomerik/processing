class Building {

  PVector loc;

  float w;
  float h;
  float d;

  float minX;
  float minimumX = 40;
  float maxX;
  float maximumX = 60;
  float minY;
  float minimumY = 60; 
  float maxY;
  float maximumY = 80;
  float minZ;
  float minimumZ = 80;
  float maxZ;
  float maximumZ = 100;


  boolean citizenInBuilding;


  color c;
  color s;



  Building() {

    w = random(minimumX, maximumX);
    h = random(minimumY, maximumY);
    d = random(minimumZ, maximumZ);

    loc = road.getRandomLocation(w, h);                                                    //gebaseerd op oefenzitting 4

    calculateBoundaries();
    checkPark();
    setColor();
  }


  void calculateBoundaries() {                                                             //gebaseerd op oefenzitting 4
    
    minX = loc.x - w/2;
    maxX = loc.x + w/2;
    minY = loc.y - h/2;
    maxY = loc.y + h/2;
    minZ = loc.z - d/2;
    maxZ = loc.z + d/2;
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
      
      if (distance < h) {
        
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
      
      loc = road.getRandomLocation(w, h);
      
      calculateBoundaries();
    }
  }



  void render() {
    
    for (Citizen c : citizens) {
      
      if (checkInside(c)) {
        
        if (d< 200) {
          
          d +=0.04;
        } 
        
        else {
          
          d= 200;
        }
      }
    }

    for (Building b : buildings) {
      
      if (checkTouching(b)) {
        
        loc = road.getRandomLocation(w, h);
        
        calculateBoundaries();
      }
    }


    fill(c);
    stroke(s);
    strokeWeight(1);
    pushMatrix();                        //gebaseerd op hoorcollege 7 

    translate(loc.x, loc.y, d/2);          
    box(w, h, d);
    popMatrix();
  }
}