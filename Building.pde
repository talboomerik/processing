class Building extends Box{                                                //subklasse building

  float minimumWidth;                                                      //variatie afmetingen gebouwen 
  float maximumWidth;
  float minimumHeight;
  float maximumHeight;
  float minimumDepth;
  float maximumDepth;
  
  float growthFactor;                                                      //bepaalt hoe snel de gebouwen groeien
  float maximumCapacity;                                                   //maximum hoogte gebouw
  
  boolean touching;
  
  Building() {                                                             //erft de constructor van box over 
    growthFactor = 0.04;
    maximumCapacity = 200;
    setDimensionsOfBuilding();
    setCenterOfBuilding();



  }
  void setDimensionsOfBuilding() {                                         //stelt de afmetingen van de gebouwen in
    width = random(minimumWidth, maximumWidth);
    height = random(minimumHeight, maximumHeight);
    depth = random(minimumDepth, maximumDepth);
  }
  
  boolean overlapWithPark() {                                              //gebaseerd op hoorcollege 6; controleert of er een gebouw in het park staat 
    return (park.isInside(left, bottom)
      ||park.isInside(left, top)
      ||park.isInside(right, bottom)
      ||park.isInside(left, bottom));
  }

  void setCenterOfBuilding() {                                             //?
    centerOfBox = world.getRandomLocation(width, height);                                                   
    calculateBoundaries();
    if (overlapWithPark()) {
      centerOfBox = world.getRandomLocation(width, height);                                    
      calculateBoundaries();
    }
  }



  boolean checkInside(Citizen citizen) {                                  //gebaseerd op oefenzitting 4; controleert of er zich een burger in een gebouw bevindt 
    boolean withinWidth = citizen.loc.x > left && citizen.loc.x < right ;
    boolean withinHeight = citizen.loc.y > bottom && citizen.loc.y < top ;
    boolean withinDepth = citizen.loc.z > front && citizen.loc.z < back ;

    return (withinWidth && withinHeight && withinDepth);
  }



  //this can be moved to world, is not behaviour of a building but of a world
  boolean checkTouching(Building otherBuilding) {                        //controleert of gebouwen elkaar aanraken 
    touching = false;

    if (otherBuilding != this) {
      float distance = dist(this.centerOfBox.x, this.centerOfBox.y, otherBuilding.centerOfBox.x, otherBuilding.centerOfBox.y); //formule uit Nature of code

      if (distance < height) {
        touching = true;
      } else {
        touching = false;
      }
    }
    return touching;
  }

  void updateCapacity() {                                                //indien er zich agenten in een gebouw bevinden gaat de capaciteit van het gebouw gaan groeien met snelheid growthFactor tot de maximumCapacity bereikt is
    for (Citizen citizen : citizens) {
      if (checkInside(citizen)) {
        if (depth < maximumCapacity) {
          depth += growthFactor;
        } else {
          depth= maximumCapacity;
        }
      }
    }
  }

  void render() {  
    super.render();                                                    //de render van box wordt overgeerfd
    updateCapacity();  

    //this can be moved to world, is not behaviour of a building but of a world
    for (Building building : buildings) {

      if (checkTouching(building)) {

        centerOfBox = world.getRandomLocation(width, height);

        calculateBoundaries();
      }
    }


   
  }
}