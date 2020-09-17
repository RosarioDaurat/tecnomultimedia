void Marte() {

  if (tamMarX > 460 && laverdad == false) {
    estado= "visitaMarte";
    png = 9;
  }

  if ( estado.equals("visitaMarte")) {
    background( Imagenjpg[9]);
    image(Imagenpng[png], -400, height-700, tamMarX*3, tamMarY*3);
    text("Pulsa ENTER para conversar", 150, 25);
  }

  if (tamMarX > 520) {
    Crece= false;
  }

  if (estado.equals("DialogoMarte")) {
    noStroke();
    fill(255);
    ellipse(600, 260, 210, 110);
    fill(0);
    text(DialogoMar[num], 600, 250);
    rect(0, 0, 300, 25);
    fill(255);
    text("Pulsa ENTER para continuar", 150, 25);
    x = 1;
  }

  if (estado.equals("DialogoMarte") && num == 2) {
    stroke(0);
    fill(200, 150, 20);
    rect(botonx, botony, bancho, balto);
    rect(botonx+bancho, botony, bancho, balto);
    fill(0);
    text("Ir a conocer \n comunidad", botonx+bancho/2, botony+botony/3);
    text("Ir a conocer \n sus casas ", botonx + bancho+bancho/2, botony+botony/3);
  }

  if ( estado.equals("comunidad")&& num < 6) {
    background( Imagenjpg[9]);
    image(Imagenpng[png], 0, 0, width, height);
    noStroke();
    fill(255);
    ellipse(600, 260, 210, 110);
    fill(0);
    text(DialogoMar[num], 600, 240);
    fill(0);
    rect(0, 0, 300, 25);
    fill(255);
    text("Pulsa ENTER para continuar", 150, 25);
  }

  if (estado.equals("comunidad") && num == 5) {
    fill(0);
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
    image( Imagenjpg[jpg], -200, 0, 1163, 600);
    fill(0);
    rect(0, 0, 300, 25);
    fill(255);
    text("Pulsa ENTER para continuar", 150, 25);
  }

  if (estado.equals("Volar")) {
    background( Imagenjpg[9]);
    image(Imagenpng[png], navex, navey, 296, 184);
    navex++;
    navey-=2;
    sonido.play();
  }

  if (navey<-200) {
    background( Imagenjpg[9]);
    image( Imagenpng[png-1], 0, 0, width, height);
    fill(0);
    rect(0, 0, 300, 25);
    fill(255);
    text("Pulsa ENTER para continuar", 150, 25);
    navey=-200;
    estado = "aterrizar";
  }

  if (estado.equals("aterrizar")) {
    noStroke();
    fill(255);
    ellipse(600, 260, 220, 120);
    fill(0);
    text(DialogoMar[num], 600, 230);
    fill(0);
    rect(0, 0, 300, 25);
    fill(255);
    text("Pulsa ENTER para continuar", 150, 25);
     sonido.pause();
  }

  if (estado.equals("No viajar")) {
    background( Imagenjpg[9]);
    image(Imagenpng[png], 0, 0, width, height);
    noStroke();
    fill(255);
    ellipse(600, 260, 210, 110);
    fill(0);
    text(DialogoMar[num], 600, 247);
    rect(0, 0, 300, 25);
    fill(255);
    text("Pulsa ENTER para continuar", 150, 25);
  }

  if (estado.equals("Cohete")) {
    background( Imagenjpg[9]);
    image(Imagenpng[png], 0, 0, width, height);
    image(Imagenpng[0], px, cohetey, tamx, tamy);
    fill(0);
    rect(0, 0, 300, 50);
    fill(255);
    text("Presiona el cohete para volver \n a la tierra", 150, 25);
  }

  if ( estado.equals("Casas")) {
    Casas = true;
  }

  if (Casas) {
    background( Imagenjpg[9]);
    image(Imagenpng[png], casasx, 100, 820, 500);
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
    image( Imagenjpg[jpg], -94, 0, 994, 600);
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
    background( Imagenjpg[9]);
    image(Imagenpng[png-1], 0, 0, width, height);
    image(Imagenpng[0], px, cohetey, tamx, tamy);
    fill(0);
    rect(0, 0, 300, 50);
    fill(255);
    text("¡Rapido! \n Presiona el cohete para escapar", 150, 25);
  }

  if ( estado.equals("volver")) {
    Volver = true;
    png = 12;
  }
  if (Volver == true) {
    background( Imagenjpg[9]);
    image(Imagenpng[png], 0, 0, width, height);
    image(Imagenpng[0], px, cohetey, tamx, tamy);
    cohetey-=2;
  }

  if ( estado.equals("volver") && cohetey == -300) {
    estado = "creditos";
  }

  if ( estado.equals("No rescatar")) {
    image( Imagenjpg[jpg], -94, 0, 994, 600);
    noStroke();
    fill(255);
    ellipse(width/2, height/2-100, 200, 100);
    fill(0);
    text(DialogoMar[num], width/2, height/2-110);
    rect(0, 0, 300, 25);
    fill(255);
    text("Pulsa ENTER para continuar", 150, 25);
    x = 4;
  }

  if ( estado.equals("carcel")) {
    Carcel = true;
  }

  if (Carcel == true) {
    image( Imagenjpg[jpg], -94, 0, 994, 600);
    image(Imagenpng[png+1], 0, carcely, width, height );
    carcely+=3;
  }

  if (carcely >= 0) {
    carcely = 0;
  }

  if (estado.equals("carcel") && carcely == 0) {
    estado = "creditos";
  }
}
