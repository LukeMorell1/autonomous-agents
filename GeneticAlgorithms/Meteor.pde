class Meteor{
  PVector location, velocity, startl;
  float size, maxSpeed, angle;
  int vertices;
  
  Meteor(){
    location = new PVector(random(1000,2000),random(0,height));
    velocity = new PVector(random(-2,-6),random(-1,1));
    size = random(15,25);
    maxSpeed = size/5;
    angle = random(2*PI);
    vertices = int(random(5,10));
    startl = location.copy();
}

    void display(){
    pushMatrix();
    translate(location.x,location.y);
    rotate(angle);
    fill(125);
    beginShape();
    for(int i = 0; i < vertices; i++){
      float r = size/2+random(-3, 3);
      float theta = (i-1)*2*PI/vertices;
      vertex(r*cos(theta), r*sin(theta));
    }
    endShape();
    popMatrix();
  }
  void move(){
    location.add(velocity);
    if(location.y-size/2 < 0 || location.y+size/2 > height)velocity.y*=-1;
  }
  void update(){
    move();
    display();
    angle += velocity.mag()/10.0;
  }
  void reset(){
    location = startl.copy();
  }
}
