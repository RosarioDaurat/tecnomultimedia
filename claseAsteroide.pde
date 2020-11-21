class Asteroide {
  float ax, ay, atam, adir;
  PImage Asteroide;
  boolean romper, choque;
  Imagenes imagen;

  Asteroide() {
    imagen = new Imagenes();
    atam = random(50, 100);
    ay = random (height-atam);
    ax= random(width+atam, width*2);
    adir= random(1, 3);
    Asteroide = loadImage("Imagen12.png");
  }

  void dibujar () {
    if (romper || choque || ax < -atam ) {
      ax = random(width+atam, width*2);
      ay = random (height-atam);
    } else {
      image(Asteroide, ax, ay, atam, atam);
    }
  }

  void romper() {
    romper = true;
  }

  void chocar() {
    choque = true;
  }

  void mover() {
    if (ax<-atam) {   
      ax = random(width+atam, width*2);
    }
    ax-= adir;
  }
}
