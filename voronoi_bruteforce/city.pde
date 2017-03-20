class city{
  
  PVector loc;
  Table lista;
  float c1;
  
  city(float x, float y,float c){
    loc = new PVector(x,y);
    c1 = c;
  }
  void show(){
    fill(0);
    ellipse(loc.x,loc.y,5,5);
 
  }
  void voronoitile(city[] cities){
   int rows = height/es;
   int cols = width/es;
   int siz = es/2;
   for(int i=0; i <= cols; i++){
     for(int j=0; j <= rows; j++){
      float x = i*es;
      float y = j*es;
      PVector tileloc = new PVector(x,y);
      float disttemp = PVector.dist(tileloc,loc);
      int flag = 1;
      ArrayList<PVector> clines = new ArrayList<PVector>();
      for(city c: cities){
        float distcomp = PVector.dist(c.loc,tileloc);
        if(disttemp > distcomp){
          flag = 0;
        }  
      }
      if(flag == 1){
        rectMode(CENTER);
        colorMode(HSB);
        fill(c1,125,255);
        noStroke();
        rect(x,y,siz,siz);
      }
     }
   }
  }
}