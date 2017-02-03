int sc = 10;
//revisar en P3D como va height/widht.
int h=600;
int w=600;
int fil = h/sc;
int col = w/sc;
//los valores x e y de los vertices son fijos, colocar los z en un array
float[][] terreno = new float[col][fil];
//array bidimensional (matriz vamos), es raro como se inicializa
float vel = 0;

void setup() {
 size(1920,1080,P3D);
 colorMode(HSB);
}

void draw(){
  
  //ajustes previos
  background(25);
  stroke(150);
  //noStroke();
  //noFill();
  translate(width/2,height/2);
  rotateX(PI/3);
  translate(-width/2,-height/2);
  
  //generar ruido
  float yn  = vel;
  for(int y = 0; y < fil; y++){
    float xn = 0;
    for(int x = 0; x < col; x++){
      terreno[x][y] = map(noise(xn,yn),0,1,-100,+100);
      xn += 0.1;
    }
    yn += 0.1;
  }
  
  //crear la malla de vertices
  for(int y = 0; y < fil-1; y++){
    beginShape(TRIANGLE_STRIP);
    for(int x = 0; x < col; x++){ //<>//
      //control color
      float sat = map(mouseY,0,height,0,255);
        //color (solo va hasta 225 porque el rosa (250) es feo
        fill(map(terreno[x][y],-100,100,0,225),255,sat);
        //greyscale, comentar fuera color
        //fill(map(terreno[x][y],-100,100,0,250));
      //vertices centrados
      vertex(x*sc+660,y*sc+240,terreno[x][y]);
      vertex(x*sc+660,(y+1)*sc+240,terreno[x][y+1]);
    }
  endShape();
  }
  
  //desplazamiento
  vel -=map(mouseX,0,width,0,0.1);
}