// A simple Bubble class

class Bubble {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  Bubble(PVector l) {
    acceleration = new PVector(0, -0.05);
    velocity = new PVector(random(-1, 1), random(-2, 0));
    position = l.copy();
    lifespan = 200;
  }

  void run() {
    update();
    display();
  }

  // Method to update position
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 1.0;
  }

  // Method to display
  void display() {
    noStroke();
    //fill(122,222,255, lifespan);
    fill(myColor, lifespan);
    ellipse(position.x, position.y, 8, 8);
  }

  // Is the particle still useful?
  boolean isDead() {
    return (lifespan < 0.0);
  }
}