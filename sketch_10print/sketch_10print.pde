void setup(){
  size(250,800);
  background(255);
}
int x = 0;
int y = 0;
int sc = 10;
void draw(){
  if (random(1)<0.5) {
    line(x,y,x+sc,y+sc);
  }else{
    line(x+sc,y,x,y+sc);
  }
  x +=sc;
  if (x > width){
    x = 0;
    y +=sc;
  }
}