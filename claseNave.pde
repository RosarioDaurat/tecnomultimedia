class Nave {
  int px, py, tamx, tamy, vidas;
  PImage Nave;
  boolean choque;
  Imagenes imagen;
  Disparo bala;

  Nave() {
    bala = new Disparo();
    imagen = new Imagenes();
    tamx= width/4;
    tamy=height/5;
  }

  void moverDerecha() {
    if (px<width-tamx) {
      px+=2;
    }
  }
  void moverIzquierda() {
    if (px>0) {
      px-=2;
    }
  }
  void moverArriba() {
    if (py>0) {
      py-=2;
    }
  }
  void moverAbajo() {
    if (py<height-tamy) {
      py+=2;
    }
  }

  void dibujar () {
    imagen.dibujarImagen(11, px, py, tamx, tamy);
    bala.dibujar(px+tamx/2, py+tamy/2);
  }

  void disparaBala() { 
    bala.disparada();
  }
}
