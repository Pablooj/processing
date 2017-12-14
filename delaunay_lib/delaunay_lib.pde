import megamu.mesh.*;

delset delset = new delset();

void setup(){
  size(960,540);
}

//mouseclick add points
int count = 0;
void mouseClicked(){
  if (mouseButton == LEFT){
      delset.addpoint(mouseX,mouseY); //<>//
      count +=1;
    }else if(mouseButton == RIGHT && count > 0){
      delset.removepoint();
      count -=1;
    }
  }

void draw(){
  background(75);
  delset.triangulate();
}