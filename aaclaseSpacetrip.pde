class Spacetrip {
  Imagenes imagen;
  Boton boton;
  Marte marte;
  Jupiter jupiter;
  Creditos creditos;
  String estado;
  int  transpa, lineasx, py, py2, px, tamx, tamy, tamjx, tamjy;
  PFont titulo, texto;
  boolean Mover, Crece, CreceJup;

  Spacetrip() {
    imagen = new Imagenes();
    marte = new Marte();
    jupiter = new Jupiter();
    creditos = new Creditos();

    titulo = loadFont("AgencyFB-Reg-48.vlw");
    texto = loadFont("Dialog.plain-48.vlw");
    estado = "inicio";
    py= height;
    py2= height;
    tamx= width/2;
    tamy= Y(240);
    tamjx= width/2;
    tamjy= Y(240);
  }

  void dibujar() {
    float transparencia = map(transpa, 0, 255, 0, 255);
    if (estado.equals("inicio")) {
      background(140, 194, 214);
      fill(0, transparencia);
      textAlign (CENTER);
      textFont(titulo, 70);
      text("S P A C E T R I P", X(400), Y(150));
      strokeWeight(5);
      stroke(0, transpa);
      line (0, Y(170), lineasx, Y(170));
      line (X(800), Y(75), X(800)-lineasx, Y(75));
      lineasx +=2;
      imagen.dibujarImagen(0, X(200), py-Y(300), width/2, height/2);
      transpa ++;
    }

    if (lineasx > width+X(50) && estado.equals("inicio") || lineasx < -X(50) && estado.equals("inicio")) { 
      textFont(texto, 20);
      fill(0, transparencia);
      text("Pulsa ENTER para \n continuar", X(640), Y(550));
    }

    if (Mover) {
      imagen.dibujarImagen(1, X(315), py-Y(50), X(150), Y(214));
      py-=2;
      musica.loop();
    }

    if (py<-height/2 && estado.equals("inicio")) {
      estado = "espacio";
    }

    if (estado.equals("espacio")) {
      imagen.dibujarfondo(0);
      imagen.dibujarImagen(2, px, py2, X(300), Y(300));
      py2-=2;
      px++;
      lineasx = width+X(50);
      lineasx = -X(50);
    }

    if (py<=-height) {
      Mover = false;
    }

    if (py2<-Y(400) && estado.equals("espacio")) {
      estado = "planetas";
      py2=-Y(400);
    }

    if (estado.equals("planetas")) {
      imagen.dibujarfondo(0);
      fill(255);
      textFont(texto, 20);
      text("Presiona el planeta que quieras visitar", width/2, height-height/12);
      imagen.dibujarImagen(4, 0, Y(150), tamx, tamy);
      imagen.dibujarImagen(3, width/2, Y(150), tamjx, tamjy);
    }
    if (Crece) {
      tamx +=2;
      tamy++;
      CreceJup = false;
    }
    if (CreceJup) {
      tamjx +=2;
      tamjy ++;
      Crece = false;
    }

    if (tamx > X(450) && estado.equals("planetas")) {
      estado = "marte";
    }
    if (tamjx > X(450) && estado.equals("planetas")) {
      estado = "jupiter";
    }
    if (estado.equals("jupiter")) {
      jupiter.visitaJupiter();
    }
    if (tamjx > X(500)) {
      CreceJup = false;
    }
    if (estado.equals("marte")) {
      marte.visitaMarte();
    }
    if (tamx > X(500)) {
      Crece= false;
    }
    if (estado.equals("comunidad") ) { 
      marte.comunidad();
    }
    if (estado.equals("juego") ) { 
      marte.Juego();
    } 
    if (marte.juego.contador >= 10 && estado.equals("juego")) {
      estado = "juegoGanar";
    }
    if (estado.equals("casas") ) { 
      marte.Casas();
    }
    if (estado.equals("casaAdentro") ) { 
      marte.casaAdentro();
      marte.dialogo.dialog = 6;
    }
    if (estado.equals("eleccion") ) { 
      marte.eleccion();
    }
    if (estado.equals("noRescatar") ) { 
      marte.noRescatar();
    }
    if (estado.equals("rescatar")||estado.equals("comunidad") && marte.dialogo.dialog > 6) { 
      estado = "volver";
    }
    if (estado.equals("noViajar") && marte.dialogo.dialog == 7) {
      marte.comunidad();
    }
    if (estado.equals("volver") ) { 
      marte.volver();
    }
    if (estado.equals("adentro") ) { 
      jupiter.entrarPalacio();
    }
    if (estado.equals("comedor") ) { 
      jupiter.comedor();
    }
    if (estado.equals("living") ) { 
      jupiter.living();
    }
    if (estado.equals("casarse")) {
      jupiter.casarse();
    }
    if (estado.equals("noCasarse")) {
      jupiter.noCasarse();
    }
    if ( jupiter.dialogo.dialog > 14 && estado.equals("noCasarse")||jupiter.dialogo.dialog == 13 && estado.equals("casarse")|| jupiter.sx >= width/2-X(144) ||
      marte.rejasy == 0 || marte.cohetey <= -height/2) {
      estado = "creditos";
      marte.rejasy = Y(1);
      jupiter.sx = X(255);
      jupiter.dialogo.dialog = 0;
      marte.cohetey = height/3;
    }
    if (estado.equals("creditos")) {
      creditos.dibujar();
    }
    if (estado.equals("reinicio")) { //REINICIO PROPIEDADES
      estado = "planetas";
      py= height;
      py2= height;
      tamx= width/2;
      tamy= Y(240);
      tamjx= width/2;
      tamjy= Y(240);
      jupiter.sx = -X(200);
      jupiter.px = X(750);
      marte.cx= X(960);
      marte.cohetey= Y(100);
      marte.rejasy=-height;
      creditos.creditosy=height;
      jupiter.dialogo.dialog= 0;
      marte.dialogo.dialog= 0;
      marte.Despegar = false;
      marte.cartel = false;
      marte.rejas = false;
      Mover= false;
      Crece= false; 
      CreceJup= false;
    }
  }

  void continuar(int tecla) { //keyPressed
    if (estado.equals("inicio")) {
      Mover = true;
    }
    if (tecla == ENTER) {
      imagen.continuarAventura();
    }
    if (estado.equals("marte") && marte.dialogo.dialog < 2||estado.equals("comunidad") && marte.dialogo.dialog < 5 || estado.equals("comunidad") && marte.dialogo.dialog > 5||
      estado.equals("noViajar") && marte.dialogo.dialog < 9 || estado.equals("noRescatar") && marte.dialogo.dialog < 10 ) {
      marte.conversacion();
    }
    if (estado.equals("comunidad") && marte.dialogo.dialog > 6 || estado.equals("noViajar") && marte.dialogo.dialog > 7) {
      estado= "volver";
    }
    if (estado.equals("casaAdentro") ) {
      estado = "eleccion";
    }
    if (estado.equals("noRescatar") && marte.dialogo.dialog == 9) {
      marte.rejas = true;
    }
    if (estado.equals("jupiter") && jupiter.dialogo.dialog < 3 || estado.equals("comedor") && jupiter.dialogo.dialog < 6||estado.equals("living") && jupiter.dialogo.dialog < 8||
      estado.equals("casarse") && jupiter.dialogo.dialog < 13 || estado.equals("noCasarse") && jupiter.dialogo.dialog < 16) {
      jupiter.conversacion();
    }
    marte.juego.moverNave(keyCode);
  }


  void cambiaEstado() { //mousePressed
    float distancia= dist ( mouseX, mouseY, X(200), Y(200));
    float distjup = dist( mouseX, mouseY, X(600), Y(200));

    if (distancia < tamx/2 && distancia < tamy/2  && estado.equals("planetas")) { // Crecen planetas
      Crece = true;
    }
    if (distjup < tamjx/2 && distjup < tamy/2 && estado.equals("planetas")) {
      CreceJup = true;
    }
    if (Boton(X(240), Y(75), X(160), Y(50)) && estado.equals("marte")) { //Botones 
      estado = "comunidad";
      marte.dialogo.dialog = 3;
    }
    if (Boton(width/2, Y(75), X(160), Y(50)) && estado.equals("marte")) {
      estado = "casas";
    }
    if (Boton(X(390), Y(375), X(40), Y(60)) && estado.equals("casas")) {
      estado = "casaAdentro";
    }
    if (Boton(X(240), Y(120), X(160), Y(50)) && estado.equals("eleccion")) {
      estado = "rescatar";
      marte.dialogo.dialog = 2;
    }
    if (Boton(width/2, Y(120), X(160), Y(50)) && estado.equals("eleccion")) {
      estado = "noRescatar";
      marte.dialogo.dialog = 8;
    }
    if (Boton(X(240), Y(75), X(160), Y(50))  && marte.dialogo.dialog == 5 && estado.equals("comunidad")) {
      estado = "juego";
    }
    if (Boton(width/2, Y(75), X(160), Y(50)) && estado.equals("comunidad")) {
      estado = "noViajar";
      marte.dialogo.dialog = 7;
    }
    if (Boton(X(350), Y(500), X(160), Y(50)) && estado.equals("juego")) {
      marte.iniciarJuego();
    }
    if (Boton(X(350), Y(500), X(100), Y(50)) && estado.equals("juegoGanar")) {
      estado = "comunidad";
      marte.dialogo.dialog = 6;
    }
    if (Boton(X(200), Y(200), width/2, height/2) && estado.equals("volver")) {
      marte.Despegar = true;
    }
    if (Boton (X(360), Y(420), X(72), Y(85)) && estado.equals("jupiter")) {
      estado = "adentro";
    }
    if (Boton (X(180), Y(360), X(80), Y(25)) && estado.equals("adentro")) {
      estado = "living";
      jupiter.dialogo.dialog = 7;
    }
    if (Boton (X(533), Y(360), X(80), Y(25)) && estado.equals("adentro")) {
      estado = "comedor";
    }
    if (Boton(X(240), Y(75), X(160), Y(50)) && estado.equals("living")) {
      estado = "casarse";
      jupiter.dialogo.dialog = 11;
    }
    if (Boton(width/2, Y(75), X(160), Y(50)) && estado.equals("living")) {
      estado = "noCasarse";
      jupiter.dialogo.dialog = 13;
    }
    if (Boton (X(325), Y(250), X(160), Y(50)) && estado.equals("creditos")) {
      estado = "reinicio";
    }
    marte.juego.dispararNave();
  }

  int X(int numX) { //RESIZE
    return round(map(numX, 0, 800, 0, width));
  }
  int Y(int numY) {
    return round(map(numY, 0, 600, 0, height));
  }
}
