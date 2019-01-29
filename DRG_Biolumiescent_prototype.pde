/**
 * Bioluminescent Algae Display Prototype
 * Based upon Multiple Particle Systems by Daniel Shiffman.
 *
 * Click the mouse to generate a stream of bubbles
 * at mouse position, representing bubbles in a vessel
 *
 * Each burst is one instance of a particle system
 * with Particles.
 */
import controlP5.*;

ControlP5 cp5;
int myColor = color(122, 122, 255);
int sliderValue = 200;

ArrayList<ParticleSystem> systems;

void setup() {
  size(360, 640);
  colorMode(HSB);
  cp5 = new ControlP5(this);
  cp5.addSlider("brightness")
    .setPosition(100, 610)
    .setHeight(20)
    .setRange(0, 255)
    .setDecimalPrecision(0) 
    .setValue(127) 
    ;
  systems = new ArrayList<ParticleSystem>();
  systems.add(new ParticleSystem(1, new PVector(width/2, (height*.75))));
}

void draw() {
  background(0);
  fill(15);
  rect(0, 600, width, height);

  for (ParticleSystem ps : systems) {
    ps.run();
    ps.addBubble();
  }
  if (systems.isEmpty()) {
    fill(255);
    textAlign(CENTER);
    text("click mouse to add bubbles", width/2, height/2);
  }
}

void mousePressed() {
  if (mouseY<600) {
    systems.add(new ParticleSystem(1, new PVector(mouseX, mouseY)));
  }
}

void keyPressed() {
  for (int i = systems.size()-1; i >= 0; i--) {
    ParticleSystem part = systems.get(i);
    systems.remove(part);
  }
}

void brightness(float theColor) {
  myColor = color(122, 222, int(theColor));
}