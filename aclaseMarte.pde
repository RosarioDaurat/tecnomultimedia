class Marte {
  int cx, cohetey, rejasy;
  boolean Despegar, cartel, rejas;
  Imagenes imagen;
  Dialogo dialogo;
  Boton boton, boton2, boton3, boton4, boton5, boton6;
  Juego juego;
  Creditos creditos;

  Marte() {
    imagen = new Imagenes();
    dialogo = new Dialogo();
    juego = new Juego();
    boton = new Boton(X(240), Y(75), Y(95), "ir a conocer \n comunidad");
    boton2 = new Boton(width/2, Y(75), Y(95), "ir a conocer \n casas");
    boton3 = new Boton(X(240), Y(75), Y(100), "Volar en la nave");
    boton4 = new Boton(width/2, Y(75), Y(100), "Volver al cohete");
    boton5 = new Boton(X(240), Y(120), Y(155), "Si");
    boton6 = new Boton(width/2, Y(120), Y(155), "No");
    creditos = new Creditos();
    cx= X(960);
    cohetey= Y(100);
    rejasy=-height;
  }

  void visitaMarte() {
    imagen.dibujarfondo(0);
    imagen.dibujarImagen(8, -X(160), 0, X(1066), height);
    text("Pulsa ENTER para conversar", X(160), Y(25));
    dialogo.dialogar(dialogo.dialog, X(600), Y(250), Y(250));
    if (dialogo.dialog >= 2) {
      boton.dibujar();
      boton2.dibujar();
    }
  }

  void conversacion () {
    dialogo.cambiarDialogo();
  }

  void comunidad() {
    textSize(20);
    imagen.dibujarfondo(0);
    imagen.dibujarfondo(7);
    fill(0);
    dialogo.dialogar(dialogo.dialog, X(600), Y(250), Y(233));
    if (dialogo.dialog == 6) {
      imagen.dibujarfondo(0);
      imagen.dibujarfondo(7);
      dialogo.dialogar(dialogo.dialog, X(600), Y(250), Y(230));
    }

    if (dialogo.dialog == 5) {
      boton3.dibujar();
      boton4.dibujar();
    }
    if (dialogo.dialog == 7) {
      imagen.dibujarfondo(0);
      imagen.dibujarfondo(7);
      dialogo.dialogar(dialogo.dialog, X(600), Y(250), Y(233));
    }
  }

  void iniciarJuego() {
    juego.iniciar();
    juego.dispararNave();
  }

  void Juego() {
    juego.portadaJuego();
    juego.dibujarJuego();
  }

  void Casas() {
    imagen.dibujarfondo(0);
    imagen.dibujarImagen(14, cx, Y(100), X(820), Y(500));
    cx -=2;

    if (cx < -15) {
      cx = -15;  
      noStroke();
      fill(0);
      rect(0, 0, X(300), Y(50));
      fill(255);
      text("Presiona la puerta de entrada \n para ingresar", X(160), Y(25));
      noFill();
      stroke(255, 0, 0);
      rect(X(390), Y(375), X(40), Y(60));
    }
  }

  void casaAdentro() {
    imagen.dibujarfondo(9);
    noStroke();
    fill(0);
    rect(0, 0, X(300), Y(50));
    fill(255);
    text("Pulsa ENTER para continuar", X(160), Y(25));
  }


  void eleccion() {
    stroke(0);
    boton5.dibujar();
    boton6.dibujar();
    noStroke();
    rect(0, 0, X(310), Y(100));
    fill(255);
    text("Parece que los marcianos tienen \n un humano secuestrado... \n ¿Quieres rescatarlo?", X(160), Y(25));
  }


  void volver() {
    imagen.dibujarfondo(0);
    imagen.dibujarfondo(8);
    imagen.dibujarImagen(0, X(200), cohetey, width/2, height/2);
    fill(0);
    rect(0, 0, X(300), Y(50));
    fill(255);
    text("Presiona el cohete para volver \n a la Tierra", X(160), Y(25));
    if (Despegar) {
      cohetey --;
    }
    if (dialogo.dialog == 2) {
      imagen.dibujarfondo(0);
      imagen.dibujarfondo(8);
      imagen.dibujarImagen(0, X(200), cohetey, width/2, height/2);
      fill(0);
      rect(0, 0, X(300), Y(50));
      fill(255);
      text("Rapido! \n Presiona el cohete para volver \n a la Tierra", X(160), Y(25));
    }
  }

  void noRescatar() {
    imagen.dibujarfondo(10);
    dialogo.dialogar(dialogo.dialog, width/2, Y(180), Y(180));
    if (rejas) {
      imagen.dibujarfondo(9);
      imagen.dibujarfondo(10);
      imagen.dibujarImagen(13, 0, rejasy, width, height );
      rejasy+=3;
    }
    if (rejasy >= 0) {
      rejasy = 0;
    }
  }
  int X(int numX) {
    return round(map(numX, 0, 800, 0, width));
  }
  int Y(int numY) {
    return round(map(numY, 0, 600, 0, height));
  }
}
