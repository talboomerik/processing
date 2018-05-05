class Road {
  
  float w; 
  float h;
  float d;
  
  float minX;
  float maxX;
  float minY;
  float maxY;
  float minZ;
  float maxZ;
  
  Road(float w, float h, float d) {
    
    this.w = w;
    this.h = h;
    this.d = d; 
    
    calculateBoundaries();
  }
  
  
  void render() {
    
    pushMatrix();
    
    translate(0,0,-5);
    fill(#767373);
    noStroke();   
    box(w,h,10);
    popMatrix();
    
  }
  
  
  void calculateBoundaries() {                               //gebaseerd op oefenzitting 4
    
    minX = -w/2;
    maxX= w/2;
    minY = -h/2;
    maxY= h/2;
    minZ = -d/2;
    maxZ = d/2;
  }
  
  PVector getRandomLocation(float sizeX,float sizeY) {      //gebaseerd op oefenzitting 4
    
    float newX = random(minX+sizeX/2, maxX-sizeX/2);
    float newY = random(minY+sizeY/2, maxY-sizeY/2);
    
    return new PVector(newX, newY, 2);
  }
  
  
  void setWidth(float value) {                               //gebaseerd op oefenzitting 4
    
    w = value;
    calculateBoundaries();
  }
  
  
  void setHeight( float value) {
    
    h = value; 
    calculateBoundaries(); 
  }
  
 }