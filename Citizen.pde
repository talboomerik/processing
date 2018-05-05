class Citizen {
  
  ArrayList<PVector> history = new ArrayList<PVector>();
  
  PVector loc;
  PVector vel;
  PVector acc;
  
  float r;
  
  float maxForce;
  float maxSpeed;
  
  boolean citizenInPark;
  
  Citizen(float x, float y) {
    
    loc= new PVector(x, y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    maxSpeed = 2;
    maxForce = 0.1;
    r=20;
  }


  void update() {
    
    vel.add(acc);
    vel.limit(maxSpeed);
    loc.add(vel);
    acc.mult(0);

    history.add(loc.get());                                        //gebaseerd op Nature of Code

    if (loc.x < road.minX || loc.x > road.maxX) {
      
      vel.x *= -1;
    }

    if (loc.y < road.minY || loc.y > road.maxY) {
      
      vel.y *= -1;
    }
   
  }



  void applyForce(PVector force) {                                //gebaseerd op Nature of Code
    
    acc.add(force);
  }
  
  void applyBehaviors(ArrayList<Citizen> citizens) {              //gebaseerd op Nature of Code
     
     PVector attractionForce = attract(citizens);
     Building a = buildings.get((int)random(0,buildings.size()));
     bui= new PVector(a.loc.x, a.loc.y);
     
     PVector arriveForce = arrive(bui);
     attractionForce.mult(2.5);
     arriveForce.mult(1);
     
     applyForce(attractionForce);
     applyForce(arriveForce);  
  }



  PVector arrive(PVector target) {                               //gebaseerd op Nature of Code
    
    PVector desired = PVector.sub(target, loc);
    float d = desired.mag();
    
    if (d < 100) {
      
      float m = map(d, 0, 100, 0, maxSpeed);
      desired.setMag(m);
    } 
    else {
      
      desired.setMag(maxSpeed);
    }

    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxForce);
    applyForce(steer);
    
    return steer;
  }



  void render() {
    
    pushStyle();
    stroke(255);
    strokeWeight(2);
    point(loc.x, loc.y, 2);
    popStyle();
    
    beginShape();
    stroke(60);
    strokeWeight(20);
    noFill();
    for(PVector v: history) {                                    //gebaseerd op Nature of Code
      vertex(v.x,v.y);
    }
    endShape();  
  }
  

  void checkBuildings(Citizen c) {                              //gebaseerd op hoorcollege 6
    
    for (Building b : buildings) {
      
      Building build = b;
      
      if (build.checkInside(c)) {
        
        if ((c.loc.x >= build.minX && c.loc.x <= build.minX +5) || (c.loc.x<=build.maxX && c.loc.x>=build.maxX-5)) {
          
          c.vel.x*=-7/6;
        }
        
        if ((c.loc.y >= build.minY && c.loc.y <= build.minY +5) || (c.loc.y<=build.maxY && c.loc.y>=build.maxY-5)) {
          
          c.vel.y*=-7/6;
        }
      }
    }
  }


  
  PVector attract (ArrayList<Citizen> citizens) {                 //gebaseerd op Nature of Code
    
    float desiredattraction = r*2;
    PVector sum = new PVector();
    int count = 0;

    for (Citizen other : citizens) {
      
      float d = PVector.dist(loc, other.loc);

      if ((d > 0) && (d < desiredattraction)) {

        PVector diff = PVector.sub(other.loc, loc);
        diff.normalize();
        diff.div(d);      
        sum.add(diff);
        count++;        
      }
    }

    if (count > 0) {
      
      sum.div(count);
      
      sum.normalize();
      sum.mult(maxSpeed);

      sum.sub(vel);
      sum.limit(maxForce);
    }
    return sum;
  }
  
  
  
  void checkPark(Citizen c) {                          //gebaseerd op hoorcollege 6
      
      if (park.checkInside(c)) {
        if ((c.loc.x >= park.minX && c.loc.x <= park.minX+2) || (c.loc.x<=park.maxX && c.loc.x>=park.maxX-2)) {
          c.vel.x*=-4;
        }
        if ((c.loc.y >= park.minY && c.loc.y <= park.minY+2) || (c.loc.y<=park.maxY && c.loc.y>=park.maxY-2)) {
          c.vel.y*=-4;
        }
      }
    }
}