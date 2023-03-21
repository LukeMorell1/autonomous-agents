class DNA {
  PVector [] genes;

  DNA() {
    genes = new PVector[lifespan];
    for (int i = 0; i < lifespan; i++) {
      genes[i] = PVector.random2D().setMag(random(2, 4));
    }
  }
}
