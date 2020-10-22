import ddf.minim.*;
Minim minim;
AudioPlayer musica;

Juego juego;

void setup() {
  size(800, 600);
  minim = new Minim (this);
  musica = minim.loadFile("musica.mp3");
  musica.loop();
  musica.setGain(-20);
  juego = new Juego();
  surface.setResizable(true);
}

void draw() {
  juego.portadaJuego();
  juego.dibujarJuego();

  if (keyPressed) {
    juego.moverNave(keyCode);
  }
}

void mousePressed() {
  juego.iniciar();
  juego.dispararNave();
}
