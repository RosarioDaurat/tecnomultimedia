class Disparo {
  int dx, dy, dtam;
  boolean disparar;

  Disparo() {
    dtam= 20;
  }
  void dibujar(int pdx, int pdy) {
    if (disparar) {
      dx +=5;
    } else {
      dx = pdx;
      dy = pdy;
    }
    fill(255);
    ellipse( dx, dy, dtam, dtam);

    if (dx>width) {
      dx = pdx;
      disparar = false;
    }
  }

  void disparada() {
    disparar = true;
  }
}
