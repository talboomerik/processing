class Park {

  float w; 
  float h;
  float d;

  float side;

  float minX;
  float maxX;
  float minY;
  float maxY;
  float minZ;
  float maxZ;

  PVector loc; 
  
  boolean citizenInPark;

  Park(float w, float h, float d) {
    
    this.w = w;
    this.h = h;
    this.d = d;

    side = 200;

    loc= road.getRandomLocation(w, h);

    calculateBoundaries();
  }


  void render() {

    pushMatrix();
    translate(loc.x, loc.y, -5);
    fill(#48AA54); 
    box(200, 200, 10.5);
    popMatrix();
  }
  
  
  
  void calculateBoundaries() {            //gebaseerd op oefenzitting 4
    
    minX = loc.x - side/2;
    maxX = loc.x + side/2;
    minY = loc.y - side/2;
    maxY = loc.y + side/2;
  }


  boolean isInside(float x, float y) {    //gebaseerd op oefenzitting 4
    
    boolean binnen=false;
    
    if (x>minX&&x<maxX&&y>minY&&y>minY) {
      
      binnen=true;
    }
    return binnen;
  }


  PVector getRandomLocation(float sizeX, float sizeY) {  //gebaseerd op oefenzitting 4

    float newX = random(minX+sizeX/2, maxX-sizeX/2);
    float newY = random(minY+sizeY/2, maxY-sizeY/2);

    return new PVector(newX, newY, 2);
  }
  

  boolean checkInside(Citizen c) {        //gebaseerd op oefenzitting 4
    
    citizenInPark = false; 
    
    if (c.loc.x > minX && c.loc.x < maxX &&
      c.loc.y > minY && c.loc.y < maxY) {
        
      citizenInPark = true;
    }
    return citizenInPark;
  }
}