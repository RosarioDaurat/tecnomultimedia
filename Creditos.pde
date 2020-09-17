void Creditos() {
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
    for (int i = 0; i < CreditosArray.length; i++) {
      textFont(texto, 20);
      text(CreditosArray[i], width/2, creditosy+height+400+i*50);
    }
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
    png=0;
    jpg=0;
    num=0;

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
