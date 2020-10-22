class Juego {
  PImage Controles, mouse, Estrellas;
  int cant = 20; 
  int contador;
  int vidas, boton;
  boolean empezar;
  Asteroide [] asteroide = new Asteroide[cant];
  Nave nave;
  Disparo disparo;

  Juego() {
    Estrellas = loadImage("Imagenjpg9.jpg");
    Controles = loadImage("controles.png");
    mouse = loadImage("mouse.png");
    nave= new Nave();
    disparo= new Disparo();
    for (int i=0; i<asteroide.length; i++) {
      asteroide[i] = new Asteroide();
    }
    vidas = 3;
    boton=width/8;
  }

  void portadaJuego() {
    if (!empezar) {
      image(Estrellas, 0, 0, width, height);
      image(Controles, width/2-width/4, height/3+height/10, width/5, height/5);
      image(mouse, width/2+width/7, height/3+height/10, width/7, height/5);
      fill(255, 0, 0);
      rect(width/2-boton/2, height/2+boton*2, boton, boton/2);
      fill(255);
      textAlign(CENTER);
      textSize(30);
      text("Elimina 10 asteroides para ganar", width/2, height/4);
      text("Mover", width/3+width/50, height/3+height/11);
      text("Disparar", width/2+width/5, height/3+height/11);
      textSize(20);
      text("Empezar", width/2, height/2+boton*2+boton/3);
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
      image(Estrellas, 0, 0, width, height);
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
        text("Eliminados " + contador, width-width/4, height/6);
        text("Vidas  " + vidas, width/4, height/6);
      }
      if (contador >= 10) {
        vidas = 1;
        background(0);
        textAlign(CENTER);
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
}
