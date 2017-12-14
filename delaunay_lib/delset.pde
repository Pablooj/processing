class delset{
  ArrayList<PVector> set;
  float x;
  float y;
  float z;
  
  delset(){
    set = new ArrayList<PVector>();
  }
  void addpoint(float posX, float posY){
    set.add(new PVector(posX,posY));
  }
  void removepoint(){
    set.remove(count-1);
  }
  void triangulate(){
    float tempset[][] = new float[set.size()][2];
    for(int i = 0; i < set.size(); i++){
      PVector temp = set.get(i);
      tempset[i][0] = temp.x;
      tempset[i][1] = temp.y;
    }
    Delaunay delset = new Delaunay(tempset);
    float[][] edgeset = delset.getEdges();
    for(int i=0; i<edgeset.length; i++){
      float startX = edgeset[i][0];
      float startY = edgeset[i][1];
      float endX = edgeset[i][2];
      float endY = edgeset[i][3];
      stroke(204, 102, 0);
      strokeWeight(2);
      line( startX, startY, endX, endY );
    }
  }
}