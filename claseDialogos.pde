class Dialogo {
  String [] DialogoJup  = {"¡Hola! \n bienvenido a Jupiter", "Soy el rey \n y gobierno \n este planeta", "Te llevaré a \n conocer mi \n palacio", "Sabes... \n me encanta tomar \n esta sopa de...", "humano.", "¡Jajaja! \n tonto humano, \n caiste en mi trampa", "Te convertiras \n en mi proxima \n sopa", "Me \n alegra que hayamos \n venido aqui", "Te presento a mi hija \n la princesa", "Disculpala, \n es un poco lenta", "Quiero que te cases \n con ella \n ¿Qué dices?", 
    "¡Que alegria! \n serán una pareja muy \n feliz", "Ahora te \n convertirás en el \n nuevo rey de Júpiter \n ¡Felicidades!", "Mira lo has hecho, \n ¡Nadie hace llorar \n a mi hija!", "Mis soldados van \n a asesinarte \n ¡Por insolente!" };

  String [] DialogoMar = {"¡Hola! \n bienvenido a Marte", "Somos marcianos \n y nos alegra \n tener visitas", "¿Que quieres hacer \n con nosotros?", "¡Hola terricola!", "Bienvenido \n a nuestro mundo, \n no recibimos muchas \n visitas", "¿Te gustaria ir \n a dar un paseo \n en nuestra nave?", "Ha sido un \n buen viaje! \n ¡vuelve pronto!", "Que pena, \n te llevaremos a \n tu nave", 
    "Humanos... \n se trancionan entre \n ellos", "Ahora \n te encerraremos \n a ti"};
  int dialog, dx, dy, texty;

  Dialogo() {
  }

  void dialogar(int dialog_, int dx_, int dy_, int texty_) {
    dialog = dialog_;
    dx = dx_;
    dy = dy_;
    texty = texty_;
    textAlign(CENTER);
    noStroke();
    fill(255);
    ellipse(dx, dy, X(220), Y(120));
    fill(0);
    text(DialogoMar[dialog], dx, texty);
    rect(0, 0, width/2, Y(50));
    fill(255);
    text("Pulsa ENTER para continuar", X(160), Y(25));
  }
  void dialogarJup(int dialog_, int dx_, int dy_, int texty_) {
    dialog = dialog_;
    dx = dx_;
    dy = dy_;
    texty = texty_;
    noStroke();
    fill(255);
    ellipse(dx, dy, X(220), Y(120));
    fill(0);
    text(DialogoJup[dialog], dx, texty);
    rect(0, 0, X(300), Y(50));
    fill(255);
    text("Pulsa ENTER para continuar", X(160), Y(25));
  }

  void cambiarDialogo() {
    dialog ++;
  }
  int X(int numX) {
    return round(map(numX, 0, 800, 0, width));
  }
  int Y(int numY) {
    return round(map(numY, 0, 600, 0, height));
  }
}
