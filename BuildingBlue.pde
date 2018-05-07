class BlueBuilding extends Building {              //gebouwen die dienst doen als woningen 

  BlueBuilding () {
                                    //de constructor van Building wordt overgeerfd; kleur en limieten worden teoegekend
    fillColor= #2C20E3;
    minimumWidth = 40;
    maximumWidth = 60;
    minimumHeight = 40;
    maximumHeight = 60;
    minimumDepth = 80;
    maximumDepth = 100;
    setDimensionsOfBuilding();
    setCenterOfBuilding();
  }

  void render() {
    super.render();                                //de render van building wordt overgeerfd
  }
}