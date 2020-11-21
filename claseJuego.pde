class Juego {
  PImage Controles, mouse, Estrellas;
  int cant = 20; 
  int contador;
  int vidas, boton;
  boolean empezar;
  Asteroide [] asteroide = new Asteroide[cant];
  Nave nave;
  Disparo disparo;
  Imagenes imagen;
  Boton botonJuego;

  Juego() {
    imagen = new Imagenes();
    nave= new Nave();
    disparo= new Disparo();
    botonJuego = new Boton(X(350), Y(500), Y(530), "Empezar");
    for (int i=0; i<asteroide.length; i++) {
      asteroide[i] = new Asteroide();
    }
    vidas = 3;
    boton=width/8;
  }

  void portadaJuego() {
    if (!empezar) {
      imagen.dibujarfondo(0);
      imagen.dibujarImagen(9, X(200), Y(260), X(160), Y(120));
      imagen.dibujarImagen(10, X(515), Y(260), X(114), Y(120));
      fill(255);
      textAlign(CENTER);
      textSize(30);
      text("Elimina 10 asteroides para continuar la historia", width/2, Y(150));
      text("Mover", X(282), Y(254));
      text("Disparar", X(560), Y(254));
      textSize(20);
      botonJuego.dibujar();
    }
  }

  void iniciar() {
    if ( mouseX>width/2-boton/2 && mouseX<width/2+boton/2 && mouseY>height/2+boton*2 && mouseY < height/2+boton*2+boton/2 && empezar == false) {
      empezar = true;  
      for (int i=0; i<asteroide.length; i++) {
        vidas = 3;
        contador = 0;
        nave.px = 0;
        nave.py = height/3;
        asteroide[i].romper = false;
        asteroide[i].choque = false;
        asteroide[i].dibujar();
        asteroide[i].ax = random(width+asteroide[i].atam, width*2);
        asteroide[i].mover();
      }
    }
  }

  void dibujarJuego() {
    if (empezar) {
      imagen.dibujarfondo(0);
      nave.dibujar();
      for (int i=0; i<asteroide.length; i++) {
        asteroide[i].dibujar();
        asteroide[i].mover();
      }
      romperAsteroide();
      choqueNave();
      fill(255, 255, 0);
      textSize(30);
      if (vidas>0 && contador < 10) {
        text("Eliminados " + contador, X(600), Y(100));
        text("Vidas  " + vidas, X(200), Y(100));
      }
      if (contador >= 10) {
        vidas = 1;
        background(0);
        textAlign(CENTER);
        fill(46, 170, 55);
        rect(width/2-boton/2, height/2+boton*2, boton, boton/2);
        fill(255);
        textSize(20);
        text ("Continuar", width/2, height/2+boton*2+boton/3);
        textSize(50);
        text("¡GANASTE!", width/2, height/2);
      }
      if  (vidas < 1) {
        empezar = false;
      }
    }
  }

  void dispararNave() {
    for (int i=0; i<asteroide.length; i++) {
      if (asteroide[i].ax < width) {
        nave.disparaBala();
      }
    }
  }

  void choqueNave() {
    for (int i=0; i<asteroide.length; i++) {
      float distan = dist(asteroide[i].ax, asteroide[i].ay, nave.px, nave.py);
      if (distan < nave.tamx/3) {
        vidas--;
        asteroide[i].chocar();
      }
    }
  }

  void romperAsteroide() {
    for (int i=0; i<asteroide.length; i++) {
      float distan = dist(asteroide[i].ax, asteroide[i].ay, nave.bala.dx, nave.bala.dy);
      if (distan < asteroide[i].atam-asteroide[i].atam/3 && nave.bala.dx > nave.px+nave.tamx && nave.bala.dx < width) {
        contador++;
        asteroide[i].romper();
      }
    }
  }

  void moverNave(int tecla) {
    if (tecla == RIGHT) {
      nave.moverDerecha();
    }
    if (tecla == LEFT) {
      nave.moverIzquierda();
    } 
    if (tecla == UP) {
      nave.moverArriba();
    }
    if (tecla == DOWN) {
      nave.moverAbajo();
    }
  }
  
  int X(int numX) {
    return round(map(numX, 0, 800, 0, width));
  }
  int Y(int numY) {
    return round(map(numY, 0, 600, 0, height));
  }
}
