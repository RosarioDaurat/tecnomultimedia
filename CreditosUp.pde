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
 nubesx = width*3;
 nubesy= py-height*2;
 viejitoy= height*3-height/3;
 viejitox= width*2+width/3;
 yfoto=height;
 }
 
 void draw(){
  background(140,194,214); 
  
   textAlign(CENTER);
   textFont(texto,40);
    text("DIRECCIÓN",px,py-900);
   textFont(texto,30);
    text("PETE DOCTER - BOB PETERSON",px , py-height-100); 
   textFont(texto,40);
    text("PRODUCCIÓN", px,py-height*2-150);
   textFont(texto,30);
    text("JONAS RIVERA - JOHN LASSETER", px,py-height*2-100);
    text("ANDREW STANTON", px,py-height*2-50);
   textFont(texto,40);
    text("PROTAGONISTAS", px,py-height*6);
   textFont(texto,30);
    text("EDWARD ASNER - JORDAN NAGA", px,py-height*6+50);
    text("CHRISTOPHER PLUMMERI", px,py-height*6+100); 
   textFont(texto,40);
    text("CRÉDITOS", width/2,py-height*8);
   textFont(texto,30);
    text("KARINA CASTILLO", width/2,py-height*8+50);
    
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
  
