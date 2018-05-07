class Park extends Box {

  boolean citizenInPark;

  Park(float width, float height, float depth) {
    super();
    this.width = width;
    this.height = height;
    this.depth = depth;

    fillColor = #109D15;


    centerOfBox= world.getRandomLocation(width, height);

    calculateBoundaries();
  }




  boolean isInside(float x, float y) {    //gebaseerd op oefenzitting 4
    calculateBoundaries();
    boolean binnen=false;

    if (x>left&&x<right&&y>bottom&&y>top) {

      binnen=true;
    }
    return binnen;
  }


  boolean checkInside(Citizen c) {        //gebaseerd op oefenzitting 4

    citizenInPark = false; 

    if (c.loc.x > left && c.loc.x < right &&
      c.loc.y > bottom && c.loc.y < top) {

      citizenInPark = true;
    }
    return citizenInPark;
  }

  void render() {
    noStroke();
    super.render();

    for (Tree t : trees) {

      t.render();
    }
  }
}