class boid {

  PVector loc;
  PVector vel;
  PVector acc;
  PVector tar;
  float maxf;
  float maxv;
  float es;


  boid(float x, float y,float z){
  acc = new PVector(0,0);
  vel = new PVector(0,0);
  loc = new PVector(x,y);
  es=z;
  maxv=3;
  maxf=0.1; 
  }
  
 void update(){
  loc.add(vel);
  vel.add(acc);
  vel.limit(maxv);
  acc.mult(0);
  
 }
 
 void disp(){
  pushMatrix();
  translate(loc.x,loc.y);
  rotate(PI/2+vel.heading());
  
  //opciones cosmeticas
  noStroke();
  fill(255);
  
  //forma
  
  beginShape();
  curveVertex(0,0);
  curveVertex(0,0);
  curveVertex(20*es,-120*es);
  curveVertex(0,-150*es);
  curveVertex(-20*es,-120*es);
  curveVertex(0,0);
  curveVertex(0,0);
  endShape();
  popMatrix(); 
  
 }
 
 void seek(){
   tar = new PVector(mouseX,mouseY);
   PVector des = PVector.sub(tar,loc);
   float d = des.mag();
   des.normalize();
   if (d<50){
     float m = map (d,0,50,0,maxv);
     des.mult(m);
   } else {
     des.mult(maxv);
   }
   PVector fuerza = PVector.sub(des,vel);
   fuerza.mult(0.001/es);
   fuerza.limit(maxf);
   acc.add(fuerza);
   
   
 }
}