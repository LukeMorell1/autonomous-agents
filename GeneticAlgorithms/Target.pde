class Target{
  PVector location;
  float size;
  Target(){
    location = new PVector(700,100);
    size = 20;
  }
  void display(){
    fill(255,255,0);
    ellipse(location.x,location.y,size,size);
  }
}
