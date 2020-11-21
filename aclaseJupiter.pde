class Jupiter {
  Imagenes imagen;
  Dialogo dialogo;
  Boton boton, boton2, boton3, boton4;
  Creditos creditos;
  int sx, px;

  Jupiter() {
    imagen = new Imagenes();
    dialogo = new Dialogo();
    boton = new Boton(X(180), Y(360), Y(90), "Living");
    boton2= new Boton(X(533), Y(360), Y(90), "Comedor");
    boton3= new Boton(X(240), Y(75), Y(100), "Casarse");
    boton4= new Boton(width/2, Y(75), Y(100), "No casarse");
    creditos = new Creditos();
    sx = -X(200);
    px = X(750);
  }

  void visitaJupiter() {
    imagen.dibujarfondo(0);
    imagen.dibujarImagen(5, -X(160), 0, X(1066), height);
    text("Pulsa ENTER para conversar", X(160), Y(25));
    dialogo.dialogarJup(dialogo.dialog, X(600), Y(250), Y(250));
    if (dialogo.dialog >= 3) {
      imagen.dibujarfondo(0);
      imagen.dibujarfondo(1);
      fill(0);
      rect(0, 0, X(300), Y(50));
      fill(255);
      text("Presiona la puerta de entrada \n para ingresar", X(160), Y(25));
    }
  }

  void entrarPalacio() {
    noStroke();
    imagen.dibujarfondo(2);
    fill(255, 0, 0);
    rect(X(180), Y(360), X(80), Y(25));
    rect(X(533), Y(360), X(80), Y(25));
    fill(255);
    text("Living", X(220), Y(383));
    text("Comedor", X(573), Y(383));
    fill(0);
    text("Presiona la habitacion a la que te quieras dirigir", width/2, Y(550));
  }

  void conversacion () {
    dialogo.cambiarDialogo();
  }

  void comedor() {
    imagen.dibujarfondo(5);
    dialogo.dialogarJup(dialogo.dialog, width/2, Y(180), Y(180));
    if (dialogo.dialog >= 4) {
      imagen.dibujarfondo(6);
      dialogo.dialogarJup(dialogo.dialog, width/2, Y(180), Y(170));
    }
    if (dialogo.dialog >= 6) {
      imagen.dibujarImagen(7, width-sx, height/2, X(288), height/2);
    }
    sx++;
  }

  void living() {
    imagen.dibujarfondo(3);
    dialogo.dialogarJup(dialogo.dialog, width/2, Y(200), Y(200));
    if (dialogo.dialog >= 8) {
      imagen.dibujarImagen(6, px, Y(280), X(266), Y(280));
      px--;
    }

    if (px < X(600)) { //LLEGA PRINCESA
      dialogo.dialog= 9;
    }

    if (px<X(420)) {
      dialogo.dialog= 10;
      dialogo.dialogarJup(dialogo.dialog, width/2, Y(200), Y(200));
      px=X(420);
    }

    if (dialogo.dialog == 10) {
      boton3.dibujar();
      boton4.dibujar();
      px=X(420);
    }
  }

  void casarse() {
    imagen.dibujarfondo(3);
    imagen.dibujarImagen(6, px, Y(280), X(266), Y(280));
    dialogo.dialogarJup(dialogo.dialog, width/2, Y(200), Y(200));
    if (dialogo.dialog == 12) {
      imagen.dibujarfondo(3);
      imagen.dibujarImagen(6, px, Y(280), X(266), Y(280));
      dialogo.dialogarJup(dialogo.dialog, width/2, Y(200), Y(180));
    }
    if (dialogo.dialog == 13) {
      imagen.dibujarfondo(3);
      imagen.dibujarImagen(6, px, Y(280), X(266), Y(280));
    }
  }

  void noCasarse() {
    imagen.dibujarfondo(4);
    dialogo.dialogarJup(dialogo.dialog, width/2, Y(200), Y(200));
    if (dialogo.dialog == 14) {
      imagen.dibujarImagen(7, sx*2, height/2, X(288), height/2);
      imagen.dibujarImagen(7, width-sx, height/2, X(288), height/2);
    }
    sx++;
  }

  int X(int numX) {
    return round(map(numX, 0, 800, 0, width));
  }
  int Y(int numY) {
    return round(map(numY, 0, 600, 0, height));
  }
}
