class GreyBuilding extends Building {                //openbare gebouwen 

  GreyBuilding () {
                                       //de constructor van Building wordt overgeerfd; kleur en limieten worden teoegekend
    fillColor= #BABAC4;
    minimumWidth = 50;
    maximumWidth = 70;
    minimumHeight = 60;
    maximumHeight = 80;
    minimumDepth = 80;
    maximumDepth = 100;
    setDimensionsOfBuilding();
    setCenterOfBuilding();
  }
  
  void render() {                                    //de render van Building wordt overgeerfd
    super.render();
  }
}