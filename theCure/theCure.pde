import ddf.minim.*;

Minim minim;
AudioPlayer player;

void setup(){
  size(600, 300, P3D);
  minim = new Minim(this);
  player = minim.loadFile("theCure.mp3");
  colorMode(HSB, 360, 100, 100);
}

void draw(){
  background(0, 50);
  
  float track = map(mouseX, 0, width, -1, 1);
  player.setPan(track);
  
  float volume = map(mouseY, 0, height, -20, 20);
  player.setGain(volume);
  
  float mixLevel  = map(player.mix.level(), 0, 0.5, 0, height/2);
  int h = int(map(player.mix.level(), 0, 0.5, 0, 360));
  stroke(h, 50, 50);
  fill(h, 50, 50);
  
  ellipse(mouseX, mouseY, mixLevel, mixLevel);
}

void mousePressed(){
  player.play();
}
