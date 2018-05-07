class Box {                                                        //Box is een superklasse. Het bevat dus alle gemeenschappelijke variabelen en methodes

  float width; 
  float height;
  float depth;

  float left;
  float right;
  float bottom;
  float top;
  float front;
  float back;

  color fillColor;
  color borderColor;

  PVector centerOfBox;

  Box() {
    fillColor = #9D9C9C;
    
  }                             

  void calculateBoundaries() {                                      //gebaseerd op oefenzitting 4, zorgt ervoor dat men binnen world gaat tekenen
    left = centerOfBox.x - width/2;
    right = centerOfBox.x + width/2;
    bottom = centerOfBox.y - height/2;
    top = centerOfBox.y + height/2;
    front = centerOfBox.z - depth/2;
    back = centerOfBox.z + depth/2;
  }


  PVector getRandomLocation(float sizeX, float sizeY) {            //gebaseerd op oefenzitting 4, zorgt ervoor dat de objecten een random locatie krijgen 

    float newX = random(left+sizeX/2, right-sizeX/2);
    float newY = random(bottom+sizeY/2, top-sizeY/2);

    return new PVector(newX, newY, 2);
  }

  void render() {                                                  //een algemene box wordt getekend
  
    fill(fillColor);
    stroke(borderColor);
    strokeWeight(1);
    pushMatrix();                        //gebaseerd op hoorcollege 7 

    translate(centerOfBox.x, centerOfBox.y, depth/2);

    box(width, height, depth);
    popMatrix();
  }
}