int sc = 10;
//revisar en P3D como va height/widht.
int h=600;
int w=615;
int fil = h/sc;
int col = w/sc;
//los valores x e y de los vertices son fijos, colocar los z en un array
float[][] terreno = new float[col][fil];
//array bidimensional (matriz vamos), es raro como se inicializa
float vel = 0;

void setup() {
 size(600,600,P3D);
 colorMode(HSB);
}

void draw(){
  
  //ajustes previos
  background(0);
  stroke(150);
  //noStroke();
  //noFill();
  translate(width/2,height/2);
  rotateX(PI/3);
  translate(-width/2,-height/2+50);
  
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
      fill(map(terreno[x][y],-100,100,0,300));
      vertex(x*sc,y*sc,terreno[x][y]);
      vertex(x*sc,(y+1)*sc,terreno[x][y+1]);
    }
  endShape();
  }
  //desplazamiento
  vel -=0.05;
}