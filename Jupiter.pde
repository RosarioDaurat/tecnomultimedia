void Jupiter() {

  if (tamjupX > 460 && laverdad == false) {
    estado = "visitaJup";
  }
  if (estado.equals("visitaJup")) {
    png = 5;
    background ( Imagenjpg[9]);
    image(Imagenpng[png], -400, height-700, tamjupX*3, tamjupY*3);
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
    text(DialogoJup[num], 600, 250);
    x = 1;
  }

  if (estado.equals("palacio")) {
    background ( Imagenjpg[9]);
    image( Imagenpng[png], 0, -100, tamjupX+tamjupX/2+50, tamjupX+tamjupX/2+50);
    fill(0);
    rect(0, 0, 300, 50);
    fill(255);
    text("Presiona la puerta de entrada \n para ingresar", 150, 25);
  }

  if ( estado.equals("adentro")) {
    noStroke();
    image( Imagenjpg[jpg], 0, -30, 800, 680);
    fill(255, 0, 0);
    rect(180, height/2+50, 75, 25);
    rect(width-270, height/2+50, 80, 25);
    fill(0);
    text("Presiona la habitacion a la que te quieras dirigir", width/2, height-50); 
    fill(255);
    text("Living", 220, height/2+70);
    text("Comedor", width-230, height/2+70);
  }


  if (estado.equals("comedor") && num <= 5) {
    image( Imagenjpg[jpg], 0, 0, width, height);
    fill(0);
    rect(0, 0, 300, 25);
    fill(255);
    text("Pulsa ENTER para continuar", 150, 25);
    noStroke();
    fill(255);
    ellipse(width/2, height/2-100, 200, 100);
    fill(0);
    text(DialogoJup[num], width/2, height/2-125);
    rect(0, 0, 300, 25);
    fill(255);
    text("Pulsa ENTER para continuar", 150, 25);
    x = 4;
  }
  if (estado.equals("comedor") && num >= 4) {
    jpg = 5;
    image( Imagenjpg[jpg], 0, 0, width, height);
    fill(0);
    rect(0, 0, 300, 25);
    fill(255);
    text("Pulsa ENTER para continuar", 150, 25);
    noStroke();
    fill(255);
    ellipse(width/2, height/2-100, 200, 100);
    fill(0);
    text(DialogoJup[num], width/2, height/2-125);
  }
  if (estado.equals("comedor") && num > 6) {
    estado = "soldado";
  }

  if (estado.equals("soldado") && soldadox<200) {
    png = 8;
    image( Imagenjpg[jpg], 0, 0, width, height);
    image(Imagenpng[png], width-soldadox, height/2, 287, 300);
    soldadox+=4;
  }


  if (estado.equals("soldado") && soldadox>=200) {
    soldadox=200;
    estado = "creditos";
  }

  if (estado.equals("living")) {
    image( Imagenjpg[jpg], -300, 0, 1315, height);
    fill(0);
    rect(0, 0, 300, 25);
    fill(255);
    text("Pulsa ENTER para continuar", 150, 25);
    noStroke();
    fill(255);
    ellipse(500, 200, 200, 100);
    fill(0);
    text(DialogoJup[num], 500, 190);
  }

  if (estado.equals("princesa")) {
    Llegaprincesa = true;
    png = 7;
  }

  if (Llegaprincesa) {
    image( Imagenjpg[jpg], -300, 0, 1315, height);
    image( Imagenpng[png], princesax, height/2-20, 260, 280);
    princesax--;
  }

  if (princesax<width-width/4 && Llegaprincesa == true ) { 
    fill(255);
    ellipse(500, 200, 200, 100);
    fill(0);
    text(DialogoJup[num], 500, 190);
  }

  if (princesax<width/2+20) {
    princesax=width/2+20;
  }

  if (princesax == width/2+20 && estado.equals("princesa")) {
    num=10;
    fill(255);
    ellipse(500, 200, 200, 100);
    fill(0);
    text(DialogoJup[num], 500, 190);
    noStroke();
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
    image( Imagenjpg[jpg], -300, 0, 1315, height);
    image(Imagenpng[png], princesax, height/2-20, 260, 280);
    fill(255);
    ellipse(500, 200, 220, 120);
    fill(0);
    text(DialogoJup[num], 500, 180);
    noStroke();
    rect(0, 0, 300, 25);
    fill(255);
    text("Pulsa ENTER para continuar", 150, 25);
    Llegaprincesa = false;
    princesax = width/2+23;
    x = 6;
  }


  if (estado.equals("No casarse")) {    
    image( Imagenjpg[jpg], -300, 0, 1315, height);
    fill(255);
    ellipse(500, 200, 200, 100);
    fill(0);
    text(DialogoJup[num], 500, 190);
    noStroke();
    rect(0, 0, 300, 25);
    fill(255);
    text("Pulsa ENTER para continuar", 150, 25);
    Llegaprincesa = false;
    princesax = width-50;
    x = 6;
  }

  if (estado.equals("soldados")) {
    image( Imagenjpg[jpg], -300, 0, 1315, height);
    image(Imagenpng[png], soldadox, height/2, 287, 300);
    image(Imagenpng[png], width-soldadox, height/2, 287, 300);
    soldadox+=4;
  }


  if (estado.equals("soldados") && soldadox == 200) {
    estado = "creditos";
  }
}
