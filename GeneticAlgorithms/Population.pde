class Population {
  ArrayList<Spaceship> population = new ArrayList<Spaceship>();
  ArrayList<Spaceship> matingPool = new ArrayList<Spaceship>();
  Spaceship best = new Spaceship();
  float mutationRate;
  int size;
  Population(int _size, float mr) {
    size = _size;
    mutationRate = mr;
    for (int i = 0; i < size; i++) {
      population.add(new Spaceship());
    }
  }
  void live() {
    println(best.fitness);
    best.c = color(255,0,0);
     ArrayList <Spaceship> s2 = new ArrayList<Spaceship>();
    if (age < lifespan) {
      for (Spaceship s : population) {
        s.applyForce(s.dna.genes[age]);
        s.update();
      }
      for (int i = 0; i < population.size(); i++) {
        if (population.get(i).leaveScreen()) s2.add(population.get(i));
        for(Meteor m: meteors){
          if(population.get(i).collision(m) == true){
               s2.add(population.get(i));
          }
        }
      }
       population.removeAll(s2);
    } else {
      computeFitness();
      matingPool();
      age = 0;
      for (Meteor m : meteors) {
        m.reset();
      }
    }
    age++;
  }
  void computeFitness() {
    for (int i = 0; i < population.size(); i++) {
      float sep = PVector.dist(population.get(i).location, t.location);
      float fitness = constrain(map(sep, 0, 1000, 100, 0), 0, 100);
      population.get(i).fitness = fitness*fitness*fitness/250.0;
      if(i != 0 && population.get(i).fitness > population.get(i-1).fitness){
        best = population.get(i); 
      }
      
    }
  }
  void matingPool() {
    matingPool.clear();
    for (Spaceship s : population) {
      for (int i = 0; i < s.fitness; i++) {
        matingPool.add(s);
      }
    }
    population.clear();
    int mps = matingPool.size();
    for (int i = 0; i < size; i++) {
      int id1 = int(random(mps));
      int id2 = int(random(mps));
      Spaceship s1 = matingPool.get(id1);
      Spaceship s2 = matingPool.get(id2);
      Spaceship s3 = new Spaceship();
      for (int j = 0; j < lifespan; j++) {
        if (int(random(1, 3)) == 1) s3.dna.genes[j] = s1.dna.genes[j];
        else s3.dna.genes[j] = s2.dna.genes[j];
        if (random(1) < mutationRate) {
          s3.dna.genes[j] = PVector.random2D().setMag(random(2, 4));
        }
      }
      population.add(s3);
    }
  }
}
