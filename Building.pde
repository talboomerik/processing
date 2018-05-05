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

  float left;
  float right;
  float bottom;
  float top;
  float front;
  float back;

  color fillColor;
  color borderColor;

  Building() {
    setDimensionsOfBuilding();
    setCenterOfBuilding();
    setColors();
  }

  void setDimensionsOfBuilding() {
    width = random(minimumWidth, maximumWidth);
    height = random(minimumHeight, maximumHeight);
    depth = random(minimumDepth, maximumDepth);
  }

  void setCenterOfBuilding() {
    while (overlapWithPark()) {
      centerOfBuilding = road.getRandomLocation(width, height);                                                    //gebaseerd op oefenzitting 4
      calculateBoundaries();
    }
  }

  void overlapWithPark() {                                                                      //gebaseerd op hoorcollege 6
    return (park.isInside(left, bottom)||park.isInside(left, top)||park.isInside(right, bottom)||park.isInside(left, bottom));
  }

  void calculateBoundaries() {                                                             //gebaseerd op oefenzitting 4
    left = centerOfBuilding.x - width/2;
    right = centerOfBuilding.x + width/2;
    bottom = centerOfBuilding.y - height/2;
    top = centerOfBuilding.y + height/2;
    front = centerOfBuilding.z - depth/2;
    back = centerOfBuilding.z + depth/2;
  }


  boolean checkInside(Citizen citizen) {                                                         //gebaseerd op oefenzitting 4
    boolean withinWidth = citizen.location.x > left && citizen.location.x < right ;
    boolean withinHeight = citizen.location.y > bottom && citizen.location.y < top ;
    boolean withinDepth = citizen.location.z > front && citizen.location.z < back ;

    return (withinWidth && withinHeight && withinDepth);
  }


  void setColors() {                                                                       //inspiratie uit inleiding Nature of code
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
    
    for (Citizen citizen : citizens) {
      
      if (checkInside(citizen)) {
        
        if (depth< 200) {
          
          depth +=0.04;
        } 
        
        else {
          
          depth= 200;
        }
      }
    }

    for (Building building : buildings) {
      
      if (checkTouching(building)) {
        
        centerOfBuilding = road.getRandomLocation(width, height);
        
        calculateBoundaries();
      }
    }


    fill(fillColor);
    stroke(borderColor);
    strokeWeight(1);
    pushMatrix();                        //gebaseerd op hoorcollege 7 

    translate(centerOfBuilding.x, centerOfBuilding.y, depth/2);
    box(width, height, depth);
    popMatrix();
  }
}