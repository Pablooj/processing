class flowfield{
  PVector[][] field;
  int cols,rows;
  int res;
  
  flowfield(int r){
    res = r;
    cols = 1600/res;
    rows = 900/res;
    field = new PVector[cols][rows];
    start();
    }
    void start(){
      float xoff = 0;
      for (int i = 0; i < cols; i++){
        float yoff=0;
        for(int j = 0; j < rows; j++){
          float ang = map(noise(xoff,yoff),0,1,0,TWO_PI);
          field[i][j]=new PVector(cos(ang),sin(ang));
          yoff +=0.01;
        }
        xoff +=0.01;
      } 
    }
    PVector retrieve(PVector loc){
      int column = int(constrain(loc.x/res,0,cols-1));
      int row = int(constrain(loc.y/res,0,rows-1));
      return field[column][row].copy();
    }
}