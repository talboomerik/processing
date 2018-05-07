class Tree extends Box{
    
    float r = random(10,20);
    float sizeT = random(20,50);
    float widthT = random(2,7);
  
    float insideX;
    float insideY;
    
    Tree() {
      
      
      centerOfBox = park.getRandomLocation(width, depth);
      
      calculateBoundaries();
      checkTouching();
 
    }
  
    
    boolean checkTouching() {
      
      boolean touching = false;

      for (Tree tree : trees) {
        
        if (tree != this) {
          
          Tree newTree = tree;
          float distance = dist(this.centerOfBox.x, this.centerOfBox.y, newTree.centerOfBox.x, newTree.centerOfBox.y); //formule uit Nature of code
        
        if (distance < height) {
          
          touching = true;
          }
        }
      }

      return touching;
    }
    
    
    
  void render() {
    
      if(!checkTouching()) {
      pushMatrix();
      stroke(#4D3B0C);
      fill(#795110);
      translate(centerOfBox.x,centerOfBox.y, 20);
      box(widthT, widthT, 50);
      popMatrix();
      
      pushMatrix();
      stroke(#0D5D16);
      fill(#32AF6D);
      translate(centerOfBox.x,centerOfBox.y, 40);
      sphere(r);
      popMatrix();}
    
  }
}
    