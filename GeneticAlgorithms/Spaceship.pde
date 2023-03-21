class Spaceship {
  PVector location, velocity, acceleration;
  float size, mass, maxSpeed, fitness;
  color c;
  DNA dna;
  Spaceship() {
    location = new PVector(100, 300);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    size = 75;
    mass = size*size/100.0;
    maxSpeed = 2;
    c = color(0, 0, 255);
    dna = new DNA();
  }
  void display() {
    fill(c);
    pushMatrix();
    translate(location.x, location.y);
    rotate(velocity.heading());
    ellipse(0, 0, size, size/5);
    arc(0, -size/20, size/2.5, size/2.5, PI, 2*PI);
    popMatrix();
  }
  void move() {
    velocity.add(acceleration);
    velocity.limit(maxSpeed);
    location.add(velocity);
    acceleration.mult(0);
  }
  void applyForce(PVector f) {
    acceleration.add(f.copy().div(mass));
  }
  boolean collision(Meteor m){
    if(dist(location.x, location.y, m.location.x, m.location.y) < (size+ m.size)/3){
      return true;
    }
    return false;
  }
  boolean leaveScreen(){
    if(location.x + size/2 < 0 || location.x - size/2 > width || location.y + size/10 < 0 || location.y - size/10 > height){
      return true;
    }
    return false;
  }
  void update() {
    display();
    move();
  }
}
