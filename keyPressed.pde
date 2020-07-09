
void keyPressed() {
  if (keyCode == ENTER) {
    Mueve = true;
  }

  if (estado.equals("visitaJup") && keyCode == ENTER) {
    estado = "DialogoJup";
    laverdad = true;
  }
  if ( estado.equals("DialogoJup") && keyCode == ENTER && x==1 ) {
    estado = "DialogoJup2";
  }
  if ( estado.equals("DialogoJup2") && keyCode == ENTER && x == 2) {
    estado = "DialogoJup3";
  }

  if (estado.equals("DialogoJup3") && keyCode == ENTER  && x == 3) {
    estado = "palacio";
  }

  if (estado.equals("living") && keyCode == ENTER ) {
    estado = "DialogoJup4";
  }
  if (estado.equals("comedor") && keyCode == ENTER ) {
    estado = "DialogoJup6";
  }
    if (estado.equals("DialogoJup4") && keyCode == ENTER && x == 4) {
    estado = "DialogoJup5";
  }
  if (estado.equals("DialogoJup5") && keyCode == ENTER && x == 5) {
    estado = "princesa";
  }
  if (estado.equals("DialogoJup6") && keyCode == ENTER && x == 4 ) {
    estado = "DialogoJup7";
  }
  if (estado.equals("DialogoJup7") && keyCode == ENTER && x == 5 ) {
    estado = "DialogoJup8";
  }
  if (estado.equals("DialogoJup8") && keyCode == ENTER && x == 6 ) {
    estado = "DialogoJup9";
  }

  if (estado.equals("casarse") && keyCode == ENTER && x == 6) {
    estado = "quedarse";
  }
  if (estado.equals("No casarse") && keyCode == ENTER && x == 6) {
    estado = "reyfurioso";
  }
  if ( estado.equals("reyfurioso") && keyCode == ENTER && x == 7) {
    estado = "soldados";
  }

  if (estado.equals("quedarse")  && keyCode == ENTER && x == 7) {
    estado = "creditos";
  }

  if (estado.equals("visitaMarte") && keyCode == ENTER) {
    estado = "DialogoMarte";
    laverdad = true;
  }
  if (estado.equals("DialogoMarte") && keyCode == ENTER && x == 1) {
    estado = "DialogoMarte2";
  }
  if (estado.equals("DialogoMarte2") && keyCode == ENTER && x == 2) {
    estado = "DialogoMarte3";
  }
  if (estado.equals("casaadentro") && keyCode == ENTER) {
    estado = "cartel";
  }
  if (estado.equals("cartel") && keyCode == ENTER && x ==3) {
    estado = "eleccion";
  }
  if (estado.equals("No rescatar") && keyCode == ENTER && x ==4) {
    estado = "DialogoMarte4";
  }
  if (estado.equals("DialogoMarte4") && keyCode == ENTER && x ==5) {
    estado = "carcel";
  }
  if (estado.equals("comunidad") && keyCode == ENTER) {
    estado = "DialogoMarte5";
  }
  if (estado.equals("DialogoMarte5") && keyCode == ENTER && x == 6) {
    estado = "DialogoMarte6";
  }
  if (estado.equals("DialogoMarte6") && keyCode == ENTER && x == 7) {
    estado = "DialogoMarte7";
  }
  if (estado.equals("Viajar") && keyCode == ENTER) {
    estado = "Volar";
  }
  if (navey==-200 && keyCode == ENTER) {
    estado="DialogoMarte8";
  }
  
  if (estado.equals("DialogoMarte8")  && keyCode == ENTER && x == 8 ) {
    estado = "Cohete";
  }
    
    if (estado.equals("No viajar") && keyCode == ENTER) {
      estado = "Cohete";
    }

   
  }
