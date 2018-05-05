class Tree {
  
    float minX;
    float maxX;
    float minY;
    float maxY;
    float minZ;
    float maxZ;
  
    float w;
    float h;
    float d;
    
    float sizeC = random(10,20);
    float sizeT = random(20,50);
    float widthT = random(2,7);
    
    PVector loc;
  
    float insideX;
    float insideY;
  
    PShape tree;
    PShape crest;
    PShape trunk;
    
    Tree() {
      
      loc = park.getRandomLocation(w, h);
      
      calculateBoundaries();
      checkTouching();
 
    }
    
    void calculateBoundaries() {      //gebaseerd op oefenzitting 4
     
      minX = loc.x -25;
      maxX = loc.x + 25;
      minY = loc.y - 25;
      maxY = loc.y + 25;
      minZ = loc.z - 25;
      maxZ = loc.z + 25;
    }
    
    boolean checkTouching() {
      
      boolean touching = false;

      for (Tree tree : trees) {
        
        if (tree != this) {
          
          Tree newTree = tree;
          float distance = dist(this.loc.x, this.loc.y, newTree.loc.x, newTree.loc.y); //formule uit Nature of code
        
        if (distance < h) {
          
          touching = true;
          }
        }
      }

      return touching;
    }
    
    
    
  void render() {
    
    if(!checkTouching()) {

      stroke(#4D3B0C);
      fill(#795110);
      trunk = createShape(BOX, widthT, widthT , 50); //internet?
      stroke(#0D5D16);
      fill(#32AF6D);
      
      crest = createShape(SPHERE, sizeC);
      crest.setTexture(img);
      
      pushMatrix();
      translate(loc.x,loc.y,20);
      shape(trunk);
      popMatrix();
      
      pushMatrix();
      translate(loc.x, loc.y, 40);
      shape(crest);
      popMatrix();
    }
  }
}
    