class Imagenes {
  int cant= 20;
  PImage Imagen [] = new PImage [15];
  PImage Fondos [] = new PImage [11];
  int num, posx, posy, tam, tamy;

  Imagenes() {
    num = 0;
    for (int i = 0; i < Imagen.length; i++) {  
      Imagen[i] = loadImage("Imagen"+i+".png");
    }
    for (int i = 0; i < Fondos.length; i++) {  
      Fondos[i] = loadImage("Fondo"+i+".png");
    }
  }  

  void dibujarfondo(int num_) {   
    num= num_;
    image(Fondos[num], 0, 0, width, height);
  }

  void dibujarImagen(int num_, int posx_, int posy_, int tam_, int tamy_) {
    num = num_;
    posx = posx_;
    posy = posy_;
    tam = tam_;
    tamy = tamy_;
    image(Imagen[num], posx, posy, tam, tamy);
  }

  void continuarAventura() { 
    num ++;
  }

  void cambiaEstado() { 
    num ++;
  }
}
