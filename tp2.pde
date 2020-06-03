/* Presionar el mouse para reproducir
    Presionar una tecla para pausar*/
PImage foto;
PImage nubes;
PImage viejito;
PImage up;
PFont texto;
int px,py,tamx,tamy,yfoto,nubesx,nubesy;
int viejitox, viejitoy;

void setup(){
  noLoop();
 size(1200,750);
 foto=loadImage("casaUp.png");
 nubes=loadImage("nubesGUION.png");
 viejito=loadImage("viejitoUp.png");
 up=loadImage("uplogo.png");
 texto=loadFont("ComicSansMS-40.vlw");


 px= width/4;
 py= 0;
 tamx= 1000;
 tamy= 550;
 nubesx = width*3+50;
 nubesy= py-height*2;
 viejitoy= height*3-height/3-50;
 viejitox= width*2+width/3+50;
 yfoto=height;

 }
 
 void draw(){
 
  background(140,194,214); 
   textAlign(CENTER);
   textFont(texto,40);
    text("DIRECCIÓN",px,py-900);
    text("PRODUCCIÓN", px,py-height*2-150);
    text("PROTAGONISTAS", px,py-height*6+height/4);
    text("MÚSICA",width/2,py-height*8+height/4);
    text("CRÉDITOS", width/2,py-height*8+height/4+150);
   textFont(texto,30);
    text("PETE DOCTER - BOB PETERSON",px , py-height-100); //directores
    text("JONAS RIVERA - JOHN LASSETER \n ANDREW STANTON", px,py-height*2-100); //productores
    text("EDWARD ASNER - JORDAN NAGA \n CHRISTOPHER PLUMMERI", px,py-height*6+50+height/4);//protagonistas
    text("MICHAEL GIACCHINO",width/2,py-height*8+50+height/4); //musico
    text("ROSARIO DAURAT", width/2,py-height*8+200+height/4); //creditos
   
  image(up,0,py-300,500,291);
   py+=2;
  
  image(foto,width/2,yfoto,tamx,tamy);
   tamx++;
   tamy++;
   yfoto-=2;
  
  image(nubes,nubesx,nubesy,600,600);
  nubesx-=2;
  nubesy++;
  
  image(viejito,viejitox,viejitoy,700,900);
  viejitox--;
  viejitoy--;
 }
 
  void mousePressed(){
  loop();
  }
  
  void keyPressed(){
    noLoop();
  }
 
