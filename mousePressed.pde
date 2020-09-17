void mousePressed() {

  float distancia= dist ( mouseX, mouseY, 200, height/3);
  float distjup = dist( mouseX, mouseY, 600, height/3);

  if (distancia < tamMarX/2 && distancia < tamMarY/2  && estado.equals("planetas")) {
    Crece = true;
  }
  if (distjup < tamjupX/2 && distjup < tamjupY/2 && estado.equals("planetas")) {
    CreceJup = true;
  }

  if ( Boton (botonx, botony, bancho, balto) && estado.equals("DialogoMarte")) {
    estado = "comunidad";
    num++;
    png++;
  }

  if (Boton (botonx+bancho, botony, bancho, balto)&& estado.equals("DialogoMarte")) {
    estado = "Casas";
    png=13;
  }
  if (Boton (width/2-10, height/2+75, 40, 60) && estado.equals("Casas")) {
    estado = "casaadentro";
    jpg = 7;
    Casas = false;
  }

  if (Boton (370, 480, 120, 80) && estado.equals("palacio")) {
    estado = "adentro";
  }

  if (Boton (width/4, height/2+balto, bancho/2, balto/2) && estado.equals("adentro")) {
    num= 7;
    estado = "living";
    jpg ++;
  }

  if (Boton (width-width/3, height/2+balto, bancho/2, balto/2) && estado.equals("adentro")) {
    estado = "comedor";
    jpg = 4;
  }

  if (Boton (botonx, botony, bancho, balto) && estado.equals("princesa")) {
    estado = "casarse";
    num++;
  }

  if (Boton (botonx+bancho, botony, bancho, balto) && estado.equals("princesa")) {
    estado = "No casarse";
    num = 13;
    jpg++;
  }

  if ( Boton (botonx, botony, bancho, balto) && estado.equals("eleccion")) {
    estado = "Rescatar";
  }
  if (Boton (botonx+bancho, botony, bancho, balto) && estado.equals("eleccion")) {
    estado = "No rescatar";
    num = 8;
    jpg++;
  }

  if (Boton (width/2-px, height/2-100, tamx, tamy) && estado.equals("Rescatar") || Boton (width/2-px, height/2-100, tamx, tamy) && estado.equals("Cohete") ) {
    estado = "volver";
  }
  if (Boton (botonx, botony, bancho, balto) && estado.equals("comunidad") && num == 5) {
    num++;
    estado = "Viajar";
    jpg = 6;
    png ++;
  }
  if (Boton (botonx+bancho, botony, bancho, balto) && estado.equals("comunidad")) {
    estado = "No viajar";
    num = 7;
  }
  
  if ( Boton (botonx+bancho/2, botony*3, bancho, balto) && creditosy<-1400 && estado.equals("creditos")) {
    estado = "Reinicio";
  }
}
