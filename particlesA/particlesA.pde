import traer.physics.*;

Particle p;
ParticleSystem physics;

void setup(){
  size(800, 800);
  frameRate(50);
  physics = new ParticleSystem(0.1, 0);
}

void draw(){
  // Important timer
  physics.tick();
  background(255, 50);
  println(physics.numberOfParticles());
  
  for(int i = 0; i < physics.numberOfParticles(); i++){
    Particle p = physics.getParticle(i);
    float x = map(p.position().x(), 0, 800, 0, 255);
    float y = map(p.position().y(), 0, 800, 0, 255);
    noStroke();
    fill(x, y, 0);
    ellipse(p.position().x(), p.position().y(), 3, 3);
    if(p.age() > 500){
      physics.removeParticle(p);
    }
  }
}

void mouseDragged(){
  Particle p = physics.makeParticle(1.0, mouseX, mouseY, 0);
}