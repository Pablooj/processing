float xoff=0;
float inc=0;
void setup(){
  size(640,360); 
}
void draw(){
  background(51);
  inc=0;
  beginShape();
  for(float x=0; x<=width; x+=20){
    float y=map(noise(xoff+inc),0,1,200,300);
    vertex(x,y);
    if(x == width/2){
     noStroke();
     fill(0,100,100);
     ellipse(x,y,20,20); 
    }
    fill(225);
    inc=inc+0.12;    
  } 
  vertex(width,height);
  vertex(0,height);
  endShape();
  
  xoff=xoff+0.01;
}