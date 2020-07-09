void mousePressed() {
  float distancia= dist ( mouseX, mouseY, 0, height/3);
  float distjup = dist( mouseX, mouseY, 400, height/3);
  if (distancia < tamMarX && distancia < tamMarY  && estado.equals("planetas")) {
    Crece = true;
  }
  if (distjup < tamjupX && distjup < tamjupY && estado.equals("planetas")) {
    CreceJup = true;
  }
  if (mouseX>botonx && mouseX<botonx+bancho && mouseY>botony && mouseY<botony+balto && estado.equals("DialogoMarte3")) {
    estado = "comunidad";
  }
  if (mouseX>botonx+bancho && mouseX<botonx+bancho*2 && mouseY>botony && mouseY<botony+balto && estado.equals("DialogoMarte3")) {
    estado = "Casas";
  }
  if (mouseX<450 && mouseX>370 && mouseY < 560 && mouseY > 480 && estado.equals("palacio")) {
    estado = "adentro";
  }

  if (mouseX>180 && mouseX<180+75 && mouseY>height/2+50 && mouseY<height/2+75 && estado.equals("adentro")) {
    estado = "living";
  }
  if (mouseX>width-270 && mouseX<width-270+75 && mouseY>height/2+50 && mouseY<height/2+80 && estado.equals("adentro")) {
    estado = "comedor";
  }
  
  if (mouseX>botonx && mouseX<botonx+bancho && mouseY>botony && mouseY<botony+balto && estado.equals("princesa")) {
    estado = "casarse";
  }
  if (mouseX>botonx+bancho && mouseX<botonx+bancho*2 && mouseY>botony && mouseY<botony+balto && estado.equals("princesa")) {
    estado = "No casarse";

  }
  if (mouseX>botonx+bancho/2 && mouseX<botonx+bancho/2+bancho && mouseY > botony*3 && mouseY < botony*3+balto && estado.equals("creditos")) {
      estado = "Reinicio";
   
  }
  if (mouseX>width/2-10 && mouseX<width/2+20 && mouseY>height/2+75 && mouseY<430 && estado.equals("Casas")) {
    estado = "casaadentro";
    Casas = false;
  }
  if (mouseX>botonx && mouseX<botonx+bancho && mouseY>botony && mouseY<botony+balto && estado.equals("eleccion")) {
    estado = "Rescatar";
  }
  if (mouseX>botonx+bancho && mouseX<botonx+bancho*2 && mouseY>botony && mouseY<botony+balto && estado.equals("eleccion")) {
    estado = "No rescatar";
  }
  if (mouseX> width/2-100 && mouseX<width/2+100 && mouseY>height/2-100 && mouseY<height/2+100 && estado.equals("Rescatar") ||mouseX> width/2-100 && mouseX<width/2+100 && mouseY>height/2-100 && mouseY<height/2+100 && estado.equals("Cohete") ) {
    estado = "volver";
  }
    if (mouseX>botonx && mouseX<botonx+bancho && mouseY>botony && mouseY<botony+balto && estado.equals("DialogoMarte7")) {
    estado = "Viajar";
  }
  if (mouseX>botonx+bancho && mouseX<botonx+bancho*2 && mouseY>botony && mouseY<botony+balto && estado.equals("DialogoMarte7")) {
    estado = "No viajar";
  }
}
