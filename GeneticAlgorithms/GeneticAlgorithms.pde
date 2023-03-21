Population p;
Target t;
ArrayList <Meteor> meteors = new ArrayList<Meteor>();
int lifespan = 600;
int age = 0;
void setup() {
  size(800,600);
  p = new Population(50, 0.01);
  t = new Target();
  for(int i = 0; i < 10; i++){
    Meteor m = new Meteor();
    meteors.add(m);
  }
}


void draw() {
  background(0);
  scene();
  t.display();
  for(Meteor m: meteors){
    m.update();
  }
  p.live();
  int a = int(random(1,3));
  println(a);
}


void scene(){
  for(int x = 10; x < width; x+=30){
    for(int y = 10; y < height; y+=30){
      float cdiam = random(2,5);
      float cvis = random(0,255);
      fill(255, cvis);
      ellipse(x,y,cdiam,cdiam);
    }
  }
}
