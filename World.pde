class World extends Box{
  
  
  World(float width, float height, float depth) {
    super();
    this.width = width;
    this.height = height;
    this.depth = depth; 
    centerOfBox = getRandomLocation(0,0);
    calculateBoundaries();
    fillColor = #9D9C9C;
  }
  
  
  void render() {
    super.render();
    for (Building b : buildings) {                                               //gebaseerd op hoorcollege 6          

      //b.checkPark();
      b.render();
    }
    
    noStroke();
    park.render();
    
    for ( Citizen c : citizens) {              
  
      c.applyBehaviors(citizens);                    
      c.update();
      c.render();
      c.checkBuildings(c);
      c.checkPark(c);
    }
    
  }
  }
  

  
  