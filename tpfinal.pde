import ddf.minim.*;
Minim minim;
AudioPlayer musica;

Spacetrip aventura;

void setup() {
  size (800, 600);
  aventura = new Spacetrip();
  minim = new Minim (this);
  musica = minim.loadFile("musica.mp3");
  musica.setGain(-20);
  musica.pause();

  surface.setResizable(true);
}

void draw() {
  aventura.dibujar();
}

void keyPressed() {
  aventura.continuar(keyCode);
}

void mousePressed() {
  aventura.cambiaEstado();
}
