// An ArrayList is used to manage the list of Bubbles

class ParticleSystem {

  ArrayList<Bubble> bubbleStream; // An arraylist for all the bubbles
  PVector origin;                 // An origin point for where bubbles begin

  ParticleSystem(int num, PVector v) {
    bubbleStream = new ArrayList<Bubble>();  // Initialize the arraylist
    origin = v.copy();                       // Store the origin point
    for (int i = 0; i < num; i++) {
      bubbleStream.add(new Bubble(origin));  // Add "num" amount of bubbles to the arraylist
    }
  }


  void run() {
    // Cycle through the ArrayList backwards, because we are deleting while iterating
    for (int i = bubbleStream.size()-1; i >= 0; i--) {
      Bubble b = bubbleStream.get(i);
      b.run(); // update bubble position and display it
      if (b.isDead()) {
        bubbleStream.remove(i);
      }
    }
  }

  void addBubble() {
    Bubble b;
    // Add a Bubble to the bubbleStream
    if (int(random(0, 2)) == 0) {
      b = new Bubble(origin);
      bubbleStream.add(b);
    }
  }

  void addParticle(Bubble b) {
    bubbleStream.add(b);
  }

  // A method to test if the particle system still has bubbles
  boolean dead() {
    return bubbleStream.isEmpty();
  }
}