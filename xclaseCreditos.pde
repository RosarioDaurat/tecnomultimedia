class Creditos {
  Boton boton;
  String [] CreditosArray = {"Titulo:  SPACETRIP", "Historia y programación: Rosario Daurat", "Profesor: Jose Luis Bugiolachi", "Materia: Tecnologia multimedial 1", "Comisión 1", "Año: 2020", "FDA, UNLP"};
  int creditosy;

  Creditos() {
    creditosy=height;
    boton = new Boton(X(325), Y(250), Y(280), "Reiniciar");
  }

  void dibujar() {
    noStroke();
    fill(0);
    rect(0, creditosy, width, height*4);
    creditosy-=3;

    if (creditosy<=0) {
      fill(255);
      textSize(60);
      text("FIN", width/2, creditosy+height);
      text("Créditos", width/2, creditosy+Y(900));
      textSize(20);
      for (int i = 0; i < CreditosArray.length; i++) {
        text(CreditosArray[i], width/2, creditosy+Y(960)+i*50);
      }
    }

    if (creditosy<-(height*3-height/3)) {
      background(0);
      boton.dibujar();
      noStroke();
      fill(0); 
      rect(0, 0, X(300), Y(50));
      fill(255);
      text("Presiona para reiniciar", X(160), Y(25));
    }
  }
  int X(int numX) {
    return round(map(numX, 0, 800, 0, width));
  }
  int Y(int numY) {
    return round(map(numY, 0, 600, 0, height));
  }
}
