class Boton {
  int botonx, botony, bancho, balto, texty;
  String texto;

  Boton(int botonx_, int botony_, int texty_, String texto_) {
    botonx = botonx_;
    botony = botony_;
    texty = texty_;
    texto = texto_;
    bancho = X(160);
    balto = Y(50);
    textAlign ( CENTER);
  }

  void dibujar () {
    noStroke();
    fill(0); 
    rect(0, 0, X(300), Y(50));
    fill(255);
    text("Selecciona una opcion", X(160), Y(25));
    stroke(0);
    fill(200, 150, 20);
    rect(botonx, botony, bancho, balto);
    fill(0);
    text(texto, botonx+bancho/2, texty);
  }

  int X(int numX) {
    return round(map(numX, 0, 800, 0, width));
  }
  int Y(int numY) {
    return round(map(numY, 0, 600, 0, height));
  }
}

boolean Boton(int botonx, int botony, int bancho, int balto) { //REVISO LA POSICION DEL MOUSE
  if (mouseX > botonx && mouseX< botonx +bancho && mouseY > botony && mouseY < botony + balto) {
    return true;
  }
  return false;
}
