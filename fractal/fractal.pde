

void setup(){
  size(400,400);
}

void draw(){
  background(50);
  stroke(255);
  translate(width/2,height);
  branch(100);
}

void branch(float len){
  float angle=map(mouseX,0,width,0,PI);
  line(0,0,0,-len);
  translate(0,-len);
  if(len > 5){
    pushMatrix();
    rotate(angle);
    branch(len*0.618);
    popMatrix();
    rotate(-angle);
    branch(len*0.618);
  }
  
}