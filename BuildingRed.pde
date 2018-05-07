class RedBuilding extends Building {                //gebouwen bedoeld voor de horeca

  RedBuilding () {                                  //de constructor van Building wordt overgeerfd; kleur en limieten worden teoegekend

    fillColor= #ff0000;
    minimumWidth = 40;
    maximumWidth = 60;
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