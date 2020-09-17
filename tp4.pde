import ddf.minim.*;
Minim minim;
AudioPlayer sonido, cohete, musica;

String [] DialogoJup  = {"¡Hola! \n bienvenido a Jupiter", "Soy el rey \n y gobierno \n este planeta", "Te llevaré a \n conocer mi \n palacio", "Sabes... \n me encanta tomar \n esta sopa de...", "humano.", "¡Jajaja! \n tonto humano, \n caiste en mi trampa", "Te convertiras \n en mi proxima \n sopa", "Me \n alegra que hayamos \n venido aqui", "Te presento a mi hija \n la princesa", "Perdona, \n es un poco lenta", "Quiero que te cases \n con ella \n ¿Qué dices?", 
  "¡Que alegria! \n serán una pareja muy \n feliz", "Ahora te \n convertirás en el \n nuevo rey de Júpiter \n ¡Felicidades!", "Mira lo has hecho, \n ¡Nadie hace llorar \n a mi hija!", "Mis soldados van \n a asesinarte \n ¡Por insolente!" };

String [] DialogoMar = {"¡Hola! \n bienvenido a Marte", "Somos marcianos \n y nos alegra \n tener visitas", "¿Que quieres hacer \n con nosotros?", "¡Hola terricola!", "Bienvenido \n a nuestro mundo, \n no recibimos muchas \n visitas", "¿Te gustaria ir \n a dar un paseo \n en nuestra nave?", "Ha sido un \n buen viaje! \n Esperamos que \n vuelvas pronto", "Que pena, \n te llevaremos a \n tu nave", 
  "Humanos... \n se trancionan entre \n ellos", "Ahora \n te encerraremos \n a ti"};

String [] CreditosArray = {"Titulo:  SPACETRIP", "Historia y programación: Rosario Daurat", "Profesor: Jose Luis Bugiolachi", "Materia: Tecnologia multimedial 1", "Comisión 1", "Año: 2020", "FDA, UNLP"};

PImage [] Imagenjpg = new PImage [10];
PImage [] Imagenpng = new PImage [15];
PFont titulo, texto;
boolean Mueve, Crece, CreceJup, Volver, Carcel, laverdad, creditos, Boton;
boolean Llegaprincesa, Casarse, NoCasarse, Quedarse, Casas, Creditos, Reiniciar;
String estado;
int jpg, png;
int x, lineasx, px, py, tamx, tamy, tamx2, tamy2, transpa, casasx, princesax, soldadox, cohetey, carcely, navex, navey, num;
int tamMarX, tamMarY, tamjupX, tamjupY;
int botonx, botony, bancho, balto, creditosy;

void setup() {
  size(800, 600);
  laverdad=false;

  minim = new Minim (this);
  sonido = minim.loadFile("Nave.mp3");
  cohete = minim.loadFile("Cohete.mp3");
  musica = minim.loadFile("musica.mp3");
  musica.setGain(-10);

  musica.pause();

  titulo = loadFont("AgencyFB-Reg-48.vlw");
  texto = loadFont("Dialog.plain-48.vlw");

  for (int i = 0; i < Imagenjpg.length; i++) {
    Imagenjpg[i] = loadImage("Imagenjpg" +i+ ".jpg");
  }
  for (int j = 0; j < Imagenpng.length; j++) {
    Imagenpng[j] = loadImage("Imagenpng" +j+ ".png");
  }

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
    image(Imagenpng[png], px, py, tamx, tamy);
  }

  if (lineasx > width+50 || lineasx < -50) { 
    textFont(texto, 20);
    fill(0, transparencia);
    text("Pulsa ENTER para \n continuar", width-width/5, height-50);
  }

  transpa ++;

  if (Mueve) { 
    image(Imagenpng[png+1], px+115, py+255, tamx/2-tamx/8, tamy-80);
    py-=2;
    cohete.play();
    musica.loop();
  }

  if (py<-tamy && laverdad==false || Reiniciar == true && laverdad==false) {
    estado = "espacio";
  }

  if (estado.equals("espacio")) {

    png =2;
    background( Imagenjpg[9]);
    image(Imagenpng[png], tamx2, tamy2, 300, 293);
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
    cohete.pause();
    estado = "planetas";
    tamy2=-400;
  }

  if (estado.equals("planetas")) {
    png = 3;
    fill(255);
    textFont(texto, 20);
    text("Presiona el planeta que quieras visitar", width/2, height-50);
    image(Imagenpng[png], 0, height/4, tamMarX, tamMarY);
    image(Imagenpng[png+1], 400, height/4, tamjupX, tamjupY);
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

  Jupiter();
  Marte();
  Creditos();
}

boolean Boton(int px, int py, int ancho, int alto) {
  if (mouseX > px && mouseX< px +ancho && mouseY > py && mouseY < py + alto) {
    return true;
  }
  return false;
}
