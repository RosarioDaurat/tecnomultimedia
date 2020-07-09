PImage Estrellas, Cohete1, fuego, Cohete2, Marte, Marte2, Jupiter, AlienJupiter, AlienJupiter1, AliensMarte, Comunidadmarte, Naveadentro, Nave, marcianosatacan, carcel;
PImage Palacio, palacioadentro, livingpalacio, princesajup, living2, living3, Soldado, Casasmarte, casaadentro, comedor, comedor2;
PFont titulo, texto;
boolean Mueve, Crece, CreceJup, Volver, Carcel, laverdad, creditos;
boolean Llegaprincesa, Casarse, NoCasarse, Quedarse, Casas, Creditos, Reiniciar;
String estado;
int x, lineasx, px, py, tamx, tamy, tamx2, tamy2, transpa, casasx, princesax, soldadox, cohetey, carcely, navex, navey;
int tamMarX, tamMarY, tamjupX, tamjupY;
int botonx, botony, bancho, balto, creditosy;

void setup() {
  size(800, 600);

  laverdad=false;

  titulo = loadFont("AgencyFB-Reg-48.vlw");
  texto = loadFont("Dialog.plain-48.vlw");
  Estrellas = loadImage("Estrellas.jpg");
  Cohete1=loadImage("Cohete1.png");
  fuego=loadImage("fuego.png");
  Cohete2=loadImage("Cohete2.png");
  Marte=loadImage("Marte.png");
  Marte2=loadImage("Marte2.png");
  Jupiter=loadImage("Jupiter.png");
  AlienJupiter=loadImage("AlienJupiter.png");
  comedor=loadImage("Comedor.jpg");
  comedor2=loadImage("Comedor2.jpg");
  Palacio=loadImage("palacio.png");
  palacioadentro=loadImage("Palacio adentro.jpg");
  livingpalacio=loadImage("living.jpg");
  living2=loadImage("living2.jpg");
  living3=loadImage("living3.jpg");
  Soldado=loadImage("Soldado.png");
  princesajup=loadImage("princesa.png");
  AliensMarte=loadImage("AliensMarte.png");
  marcianosatacan=loadImage("Marcianosatacan.jpg");
  carcel=loadImage("carcel.png");
  Casasmarte=loadImage("casasmarte.png");
  casaadentro=loadImage("casaadentro.jpg");
  Comunidadmarte= loadImage("Martecomunidad.png");
  Naveadentro=loadImage("Naveadentro.jpg");
  Nave=loadImage("Nave.png");

  estado = "inicio";
  tamx=400;
  tamy=307;
  tamy2=height;
  tamMarX= 390;
  tamMarY= 240;
  tamjupX= 390;
  tamjupY=240;
  px= width/4;
  py= height-tamy;
  bancho = 150;
  balto= 50;
  botonx =width/2-bancho;
  botony = 70;
  princesax = width-50;
  soldadox = -200;
  casasx=width+160;
  cohetey=100;
  creditosy=height;
  carcely=-height;
  navex = -50;
  navey = height-50;
}

void draw() {
  float transparencia = map(transpa, 0, 255, 0, 255);

  println ("estado es:" + estado);

  if (estado.equals("inicio")) {
    background(140, 194, 214);
    fill(0, transparencia);
    textAlign (CENTER);
    textFont(titulo, 70);
    text("S P A C E T R I P", width/2, height/4);
    strokeWeight(5);
    stroke(0, transpa);
    line (0, height/4+20, lineasx, height/4+20);
    line (width, height/4-70, width-lineasx, height/4-70);
    lineasx +=2;
    image(Cohete1, px, py, tamx, tamy);
  }
  if (lineasx > width+50 || lineasx < -50) { 
    textFont(texto, 20);
    fill(0, transparencia);
    text("Pulsa ENTER para \n continuar", width-width/5, height-50);
  }

  transpa ++;

  if (Mueve) {  
    image(fuego, px+115, py+255, tamx/2-tamx/8, tamy-80);
    py-=2;
  }

  if (py<-tamy && laverdad==false || Reiniciar == true && laverdad==false) {
    estado = "espacio";
  }

  if (estado.equals("espacio")) {
    background(Estrellas);
    image(Cohete2, tamx2, tamy2, 300, 293);
    tamx2++;
    tamy2-=2;
    lineasx = width+50;
    lineasx = -50;
    Reiniciar = false;
  }

  if (py<=-500) {
    Mueve = false;
  }

  if (tamy2<-400 && laverdad==false) {
    estado = "planetas";
    tamy2=-400;
  }

  if (estado.equals("planetas")) {
    fill(255);
    textFont(texto, 20);
    text("Presiona el planeta que quieras visitar", width/2, height-50);
    image(Marte, 0, height/4, tamMarX, tamMarY);
    image(Jupiter, 400, height/4, tamjupX, tamjupY);
  }

  if (Crece) {
    tamMarX +=2;
    tamMarY++;
    CreceJup = false;
  }
  if (CreceJup) {
    tamjupX +=2;
    tamjupY ++;
    Crece = false;
  }

  //JUPITER//

  if (tamjupX > 460 && laverdad == false) {
    estado = "visitaJup";
  }

  if (estado.equals("visitaJup")) {
    background (Estrellas);
    image(AlienJupiter, -400, height-700, tamjupX*3, tamjupY*3);
    text("Pulsa ENTER para conversar", 150, 50);
  }
  if (tamjupX > 520) {
    CreceJup = false;
  }
  if (estado.equals("DialogoJup")) {
    fill(0);
    rect(0, 0, 300, 50);
    fill(255);
    text("Pulsa ENTER para continuar", 150, 50);
    fill(255);
    ellipse(600, 260, 200, 100);
    fill(0);
    text("¡Hola! \n bienvenido a Jupiter", 600, 250);
    x = 1;
  }

  if (estado.equals("DialogoJup2")) {
    fill(0);
    rect(0, 0, 300, 50);
    fill(255);
    text("Pulsa ENTER para continuar", 150, 50);
    fill(255);
    ellipse(600, 260, 200, 100);
    fill(0);
    text("Soy el rey \n y gobierno \n este planeta", 600, 240);
    x =2;
  }

  if ( estado.equals("DialogoJup3")) {
    fill(0);
    rect(0, 0, 300, 50);
    fill(255);
    text("Pulsa ENTER para continuar", 150, 50);
    fill(255);
    ellipse(600, 260, 200, 100);
    fill(0);
    text("Te llevaré a \n conocer mi \n palacio", 600, 245);
    x = 3;
  }

  if (estado.equals("palacio")) {
    background (Estrellas);
    image(Palacio, 0, -100, tamjupX+tamjupX/2+50, tamjupX+tamjupX/2+50);
    fill(0);
    rect(0, 0, 300, 50);
    fill(255);
    text("Presiona la puerta de entrada \n para ingresar", 150, 25);
  }

  if ( estado.equals("adentro")) {
    noStroke();
    image(palacioadentro, 0, -30, 800, 680);
    fill(255, 0, 0);
    rect(180, height/2+50, 75, 25);
    rect(width-270, height/2+50, 80, 25);
    fill(0);
    text("Presiona la habitacion a la que te quieras dirigir", width/2, height-50); 
    fill(255);
    text("Living", 220, height/2+70);
    text("Comedor", width-230, height/2+70);
  }

  if (estado.equals("living")) {
    image(livingpalacio, -300, 0, 1315, height);
    fill(0);
    rect(0, 0, 300, 25);
    fill(255);
    text("Pulsa ENTER para continuar", 150, 25);
  }

  if (estado.equals("comedor")) {
    image(comedor, 0, 0, width, height);
    fill(0);
    rect(0, 0, 300, 25);
    fill(255);
    text("Pulsa ENTER para continuar", 150, 25);
  }

  if (estado.equals("DialogoJup6")) {
    noStroke();
    fill(255);
    ellipse(width/2, height/2-100, 200, 100);
    fill(0);
    text("Sabes... \n me encanta tomar \n esta sopa de...", width/2, height/2-125);
    rect(0, 0, 300, 25);
    fill(255);
    text("Pulsa ENTER para continuar", 150, 25);
    x = 4;
  }

  if (estado.equals("DialogoJup7")) {
    image(comedor2, 0, 0, width, height);
    noStroke();
    fill(255);
    ellipse(width/2, height/2-100, 200, 100);
    fill(0);
    text("humano.", width/2, height/2-100);
    rect(0, 0, 300, 25);
    fill(255);
    text("Pulsa ENTER para continuar", 150, 25);
    x = 5;
  }

  if (estado.equals("DialogoJup8")) {
    noStroke();
    fill(255);
    ellipse(width/2, height/2-100, 200, 100);
    fill(0);
    text("¡Jajaja! \n tonto humano, \n caiste en mi trampa", width/2, height/2-125);
    rect(0, 0, 300, 25);
    fill(255);
    text("Pulsa ENTER para continuar", 150, 25);
    x = 6;
  }

  if (estado.equals("DialogoJup9")) {
    image(comedor2, 0, 0, width, height);
    image(Soldado, width-soldadox, height/2, 287, 300);
    noStroke();
    fill(255);
    ellipse(width/2, height/2-100, 200, 100);
    fill(0);
    text("Ahora \n no podras salir, \n seras mi proxima \n sopa", width/2, height/2-125);
    soldadox+=2;
    x = 7;
  }

  if (estado.equals("DialogoJup9") && soldadox>200) {
    estado = "creditos";
  }

  if (estado.equals("DialogoJup4")) {
    noStroke();
    fill(255);
    ellipse(500, 200, 200, 100);
    fill(0);
    text("Me \n alegra que hayamos \n venido aqui", 500, 180);
    x = 4;
  }

  if (estado.equals("DialogoJup5")) {
    fill(255);
    ellipse(500, 200, 200, 100);
    fill(0);
    text("Te presento a mi hija \n la princesa", 500, 200);
    x =5;
  }

  if (estado.equals("princesa")) {
    Llegaprincesa = true;
  }

  if (Llegaprincesa) {
    image(livingpalacio, -300, 0, 1315, height);
    image(princesajup, princesax, height/2-20, 260, 280);
    princesax--;
  }

  if (princesax<width-width/4 && Llegaprincesa == true ) { 
    fill(255);
    ellipse(500, 200, 200, 100);
    fill(0);
    text("Perdona, \n es un poco lenta", 500, 190);
  }

  if (princesax<width/2+20) {
    princesax=width/2+20;
  }

  if (princesax == width/2+20) {
    fill(255);
    ellipse(500, 200, 200, 100);
    fill(0);
    text("Quiero que te cases \n con ella \n ¿Qué dices?", 500, 190);
    stroke(0);
    rect(0, 0, 300, 25);
    stroke(255);
    rect(botonx, botony, bancho, balto);
    rect(botonx+bancho, botony, bancho, balto);
    fill(255);
    text("¿Quieres casarte con la princesa?", 150, 25);
    text("Si", botonx+bancho/2, botony+balto/2+balto/4);
    text("No", botonx+bancho+bancho/2, botony+balto/2+balto/4);
  }

  if (estado.equals("casarse")) {
    image(livingpalacio, -300, 0, 1315, height);
    image(princesajup, princesax, height/2-20, 260, 280);
    noStroke();
    fill(255);
    ellipse(500, 200, 200, 100);
    fill(0);
    rect(0, 0, 300, 25);
    text("¡Que alegria! \n serán una pareja muy \n feliz", 500, 180);
    fill(255);
    text("Pulsa ENTER para continuar", 150, 25);
    Llegaprincesa = false;
    princesax = width/2+23;
    x = 6;
  }

  if (estado.equals("No casarse")) {   
    image(living2, -300, 0, 1315, height);
    noStroke();
    fill(255);
    ellipse(500, 180, 200, 100);
    fill(0);
    text("Mira lo has hecho, \n ¡Nadie hace llorar \n a mi hija!", 500, 170);
    rect(0, 0, 300, 25);
    fill(255);
    text("Pulsa ENTER para continuar", 150, 25);
    Llegaprincesa = false;
    princesax = width-50;
    x = 6;
  }

  if (estado.equals("reyfurioso")) {
    image(living2, -300, 0, 1315, height);
    noStroke();
    fill(255);
    ellipse(500, 180, 200, 100);
    fill(0);
    text("Mis soldados van \n a asesinarte \n ¡Por insolente!", 500, 170);
    rect(0, 0, 300, 25);
    fill(255);
    text("Pulsa ENTER para continuar", 150, 25);
    x = 7;
  }

  if (estado.equals("soldados")) {
    image(living3, 0, 0, width, height);
    image(Soldado, soldadox, height/2, 287, 300);
    image(Soldado, width-soldadox, height/2, 287, 300);
    soldadox+=4;
  }

  if (soldadox>200 && estado.equals("soldados")) {
    image(living3, 0, 0, width, height);
    image(Soldado, soldadox, height/2, 287, 300);
    image(Soldado, width-soldadox, height/2, 287, 300);
    soldadox=200;
  }

  if (estado.equals("soldados") && soldadox == 200) {
    estado = "creditos";
  }

  if (estado.equals("quedarse")) {
    noStroke();
    fill(255);
    ellipse(500, 200, 200, 100);
    fill(0);
    text("Ahora te \n convertirás en el \n nuevo rey de Júpiter \n ¡Felicidades!", 500, 170);
    rect(0, 0, 300, 25);
    fill(255);
    text("Pulsa ENTER para continuar", 150, 25);
    x = 7;
  }

  //MARTE//

  if (tamMarX > 460 && laverdad == false) {
    estado= "visitaMarte";
  }

  if ( estado.equals("visitaMarte")) {
    background(Estrellas);
    image(AliensMarte, -400, height-700, tamMarX*3, tamMarY*3);
    text("Pulsa ENTER para conversar", 150, 25);
  }
  if (tamMarX > 520) {
    Crece= false;
  }

  if (estado.equals("DialogoMarte")) {
    noStroke();
    fill(255);
    ellipse(600, 260, 200, 100);
    fill(0);
    text("¡Hola! \n bienvenido a Marte", 600, 250);
    rect(0, 0, 300, 25);
    fill(255);
    text("Pulsa ENTER para continuar", 150, 25);
    x = 1;
  }

  if (estado.equals("DialogoMarte2")) {
    noStroke();
    fill(255);
    ellipse(600, 260, 220, 120);
    fill(0);
    text("Somos marcianos \n y estamos \n muy contentos \n de tener visitas", 600, 233);
    x = 2;
  }

  if (estado.equals("DialogoMarte3")) {
    noStroke();
    fill(255);
    ellipse(600, 260, 220, 120);
    fill(0);
    text("¿Que quieres hacer \n con nosotros?", 600, 250);
  }

  if (estado.equals("DialogoMarte3")) {
    stroke(0);
    fill(200, 150, 20);
    rect(botonx, botony, bancho, balto);
    rect(botonx+bancho, botony, bancho, balto);
    fill(0);
    text("Ir a conocer \n comunidad", botonx+bancho/2, botony+botony/3);
    text("Ir a conocer \n sus casas ", botonx + bancho+bancho/2, botony+botony/3);
  }

  if ( estado.equals("comunidad")) {
    background(Estrellas);
    image(Comunidadmarte, 0, 0, width, height);
    fill(0);
    rect(0, 0, 300, 25);
    fill(255);
    text("Pulsa ENTER para continuar", 150, 25);
  }

  if (estado.equals("DialogoMarte5")) {
    noStroke();
    fill(255);
    ellipse(600, 260, 200, 100);
    fill(0);
    text("¡Hola terricola!", 600, 265);
    rect(0, 0, 300, 25);
    fill(255);
    text("Pulsa ENTER para continuar", 150, 25);
    x = 6;
  }

  if (estado.equals("DialogoMarte6")) {
    noStroke();
    fill(255);
    ellipse(600, 260, 220, 120);
    fill(0);
    text("Bienvenido \n a nuestro mundo, \n no recibimos muchas \n visitas por aqui", 600, 230);
    rect(0, 0, 300, 25);
    fill(255);
    text("Pulsa ENTER para continuar", 150, 25);
    x = 7;
  }

  if (estado.equals("DialogoMarte7")) {
    noStroke();
    fill(255);
    ellipse(600, 260, 220, 120);
    fill(0);
    text("¿Te gustaria ir \n a dar un paseo \n en nuestra nave?", 600, 240);
    rect(0, 0, 300, 25);
    fill(255);
    text("Selecciona una opcion", 150, 25);
    fill(200, 150, 20);
    stroke(0);
    rect(botonx, botony, bancho, balto);
    rect(botonx+bancho, botony, bancho, balto);
    fill(0);
    text("Si", botonx+bancho/2, botony+botony/2);
    text("No", botonx + bancho+bancho/2, botony+botony/2);
    x = 7;
  }

  if (estado.equals("Viajar")) {
    image(Naveadentro, -200, 0, 1163, 600);
    fill(0);
    rect(0, 0, 300, 25);
    fill(255);
    text("Pulsa ENTER para continuar", 150, 25);
  }
  if (estado.equals("Volar")) {
    background(Estrellas);
    image(Nave, navex, navey, 296, 184);
    navex++;
    navey-=2;
  }

  if (navey<-200) {
    background(Estrellas);
    image(Comunidadmarte, 0, 0, width, height);
    fill(0);
    rect(0, 0, 300, 25);
    fill(255);
    text("Pulsa ENTER para continuar", 150, 25);
    navey=-200;
  }

  if ( estado.equals("DialogoMarte8")) {
    noStroke();
    fill(255);
    ellipse(600, 260, 220, 120);
    fill(0);
    text("Ha sido un \n buen viaje! \n Esperamos que \n vuelvas pronto", 600, 230);
    rect(0, 0, 300, 25);
    fill(255);
    text("Pulsa ENTER para continuar", 150, 25);
    x = 8;
  }

  if (estado.equals("No viajar")) {
    background(Estrellas);
    image(Comunidadmarte, 0, 0, width, height);
    noStroke();
    fill(255);
    ellipse(600, 260, 220, 120);
    fill(0);
    text("Que pena, \n te llevaremos a \n tu nave", 600, 247);
    rect(0, 0, 300, 25);
    fill(255);
    text("Pulsa ENTER para continuar", 150, 25);
  }

  if (estado.equals("Cohete")) {
    background(Estrellas);
    image(Marte2, 0, 0, width, height);
    image(Cohete1, px, cohetey, tamx, tamy);
    fill(0);
    rect(0, 0, 300, 50);
    fill(255);
    text("Presiona el cohete para volver \n a la tierra", 150, 25);
  }

  if ( estado.equals("Casas")) {
    Casas = true;
  }

  if (Casas) {
    background(Estrellas);
    image(Casasmarte, casasx, 100, 820, 500);
    casasx -=2;
  }

  if (casasx < -15) {
    casasx = -15;  
    noStroke();
    fill(0);
    rect(0, 0, 300, 25);
    fill(255);
    text("Presiona la puerta de entrada \n para ingresar", 150, 25);
    noFill();
    stroke(255, 0, 0);
    rect(width/2-10, height/2+75, 40, 60);
  }

  if ( estado.equals("casaadentro")) {
    image(casaadentro, -94, 0, 994, 600);
    noStroke();
    fill(0);
    rect(0, 0, 300, 25);
    fill(255);
    text("Pulsa ENTER para continuar", 150, 25);
  }

  if ( estado.equals("cartel")) {
    fill(0);
    rect(0, 0, 300, 50);
    fill(255);
    text("Parece que los marcianos tienen \n un humano secuestrado...", 150, 25);
    x = 3;
  }

  if ( estado.equals("eleccion")) {
    stroke(0);
    fill(200, 150, 20);
    rect(botonx, botony, bancho, balto);
    rect(botonx+bancho, botony, bancho, balto);
    fill(0);
    text("Si", botonx+bancho/2, botony+botony/2);
    text("No", botonx + bancho+bancho/2, botony+botony/2);
    noStroke();
    rect(0, 0, 300, 50);
    fill(255);
    text("¿Quieres rescatarlo?", 150, 25);
  }

  if ( estado.equals("Rescatar")) {
    background(Estrellas);
    image(Marte2, 0, 0, width, height);
    image(Cohete1, px, cohetey, tamx, tamy);
    fill(0);
    rect(0, 0, 300, 50);
    fill(255);
    text("¡Rapido! \n Presiona el cohete para escapar", 150, 25);
  }

  if ( estado.equals("volver")) {
    Volver = true;
  }
  if (Volver == true) {
    background(Estrellas);
    image(Marte2, 0, 0, width, height);
    image(Cohete1, px, cohetey, tamx, tamy);
    cohetey-=2;
  }

  if ( estado.equals("volver") && cohetey == -300) {
    estado = "creditos";
  }

  if ( estado.equals("No rescatar")) {
    image(marcianosatacan, -94, 0, 994, 600);
    noStroke();
    fill(255);
    ellipse(width/2, height/2-100, 200, 100);
    fill(0);
    text("Humanos... \n se trancionan entre \n ellos", width/2, height/2-110);
    rect(0, 0, 300, 25);
    fill(255);
    text("Pulsa ENTER para continuar", 150, 25);
    x = 4;
  }

  if ( estado.equals("DialogoMarte4")) {
    noStroke();
    fill(255);
    ellipse(width/2, height/2-100, 200, 100);
    fill(0);
    text("Ahora \n te encerraremos \n a ti", width/2, height/2-110);
    rect(0, 0, 300, 25);
    fill(255);
    text("Pulsa ENTER para continuar", 150, 25);
    x = 5;
  }

  if ( estado.equals("carcel")) {
    Carcel = true;
  }

  if (Carcel == true) {
    image(marcianosatacan, -94, 0, 994, 600);
    image(carcel, 0, carcely, width, height );
    carcely+=3;
  }

  if (carcely >= 0) {
    carcely = 0;
  }

  if (estado.equals("carcel") && carcely == 0) {
    estado = "creditos";
  }

  //CREDITOS//

  if (estado.equals("creditos")) {
    Creditos = true;
    carcely = 1;
    soldadox = 198;
  }

  if (Creditos == true) {
    noStroke();
    fill(0);
    rect(0, creditosy, width, height*4);
    creditosy-=3;
  }

  if (creditosy<=0) {
    fill(255);
    textFont(texto, 60);
    text("FIN", width/2, creditosy+height);
    text("Créditos", width/2, creditosy+height+300);
    textFont(texto, 20);
    text("Titulo:  SPACETRIP", width/2, creditosy+height+350);
    text("Historia y programacion: Rosario Daurat", width/2, creditosy+height+400);
    text("Profesor: Jose Luis Bugiolachi", width/2, creditosy+height+450);
    text("Materia: Tecnologia multimedial 1", width/2, creditosy+height+500);
    text("Comisión 1", width/2, creditosy+height+550);
    text("Año: 2020", width/2, creditosy+height+600);
    text("FDA, UNLP", width/2, creditosy+height+650);
  }

  if (creditosy<-1400) {
    background(0);
    fill(255, 0, 0);
    rect(botonx+bancho/2, botony*3, bancho, balto);
    fill(255);
    text("Reiniciar", botonx+bancho/2, botony*3+botony/4, bancho, balto);
  }

  if (estado.equals("Reinicio")) {
    Reiniciar = true;
    carcely = 1;
  }

  if (Reiniciar == true) {
    x = 0;
    tamx=400;
    tamy=307;
    tamy2=height;
    tamMarX= 390;
    tamMarY= 240;
    tamjupX= 390;
    tamjupY=240;
    px= width/4;
    bancho = 150;
    balto= 50;
    botonx =width/2-bancho;
    botony = 70;
    princesax = width-50;
    casasx=width+160;
    cohetey=100;
    creditosy=height;
    carcely=-height;
    tamx2 = 0;
    soldadox = -200;
    navex = -50;
    navey = height-50;

    Creditos = false;
    Volver = false;
    laverdad = false;
    Mueve  = false; 
    Crece = false;
    CreceJup = false;
    Carcel = false;
    Llegaprincesa  = false;
    Casarse  = false;
    Quedarse  = false;
    Casas = false;
    NoCasarse = false;
    estado = "espacio";
  }
}
