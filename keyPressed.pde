
void keyPressed() {
  if (keyCode == ENTER && estado.equals("inicio")) {
    Mueve = true;
  }

  if (estado.equals("visitaJup") && keyCode == ENTER) {
    estado = "DialogoJup";
    laverdad = true;
  }
  
  if ( estado.equals("DialogoJup") && keyCode == ENTER && x==1 || estado.equals("living") && keyCode == ENTER || estado.equals("comedor") && keyCode == ENTER 
  || estado.equals("casarse") && keyCode == ENTER || estado.equals("No casarse") && keyCode == ENTER && x == 6) {
    num++;
  }

  if ( estado.equals("DialogoJup") && num == 3 && keyCode == ENTER) {
    estado = "palacio";
    png +=1;
  }

  if (num == 9 && keyCode == ENTER && estado.equals("living")) {
    estado = "princesa";
  }

  if ( estado.equals("No casarse") && keyCode == ENTER && num > 13) {
    estado = "soldados";
    png= 8;
  }

  if (estado.equals("casarse")  && keyCode == ENTER && num > 12) {
    estado = "creditos";
  }

  if (estado.equals("visitaMarte") && keyCode == ENTER) {
    estado = "DialogoMarte";
    laverdad = true;
  }
  
  if (estado.equals("DialogoMarte") && keyCode == ENTER && num < 2 && x==1) {
    num++;
  }
 
  if (estado.equals("casaadentro") && keyCode == ENTER) {
    estado = "cartel";
  }
  
  if (estado.equals("cartel") && keyCode == ENTER && x ==3) {
    estado = "eleccion";
  }
  if (estado.equals("No rescatar") && keyCode == ENTER && num < 10) {
    num++;
  }
  
   if (estado.equals("No rescatar") && keyCode == ENTER && num > 9) {
    estado = "carcel";
  }
  if (estado.equals("comunidad") && keyCode == ENTER && num < 5) {
    num++;
  }


  if (estado.equals("Viajar") && keyCode == ENTER) {
    estado = "Volar";
  }
  if (navey==-200 && keyCode == ENTER) {
   estado = "aterrizar";
  }
  
  if(estado.equals("aterrizar") && keyCode == ENTER && num < 7){
     num++;
  }

  if (estado.equals("aterrizar")  && keyCode == ENTER || estado.equals("No viajar") && keyCode == ENTER) {
    estado = "Cohete";
    png=12;
  }
}
