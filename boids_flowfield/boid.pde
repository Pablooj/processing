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
  maxv=3.5;
  maxf=0.15; 
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
  fill(0);
  
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
 
 void seek(flowfield flow){
   PVector des = flow.retrieve(loc);
   des.mult(maxv);
   PVector fuerza = PVector.sub(des,vel);
   fuerza.mult(0.0008/es);
   fuerza.limit(maxf);
   acc.add(fuerza);  
 }
 void repel(boid[] boids){
   float sep = 30;
   int cont=0;
   PVector sum = new PVector();
   for(boid b: boids){
     float dist = PVector.dist(loc, b.loc);
     if( dist > 0 && dist < sep){
       PVector dsep = PVector.sub(loc,b.loc);
       dsep.normalize();
       sum.add(dsep);
       cont++;
     }
     }
     if(cont > 0){
      sum.div(cont);
      sum.mult(maxv);
      PVector fuerzarep = PVector.sub(sum,vel);
      fuerzarep.limit(maxf*0.2);
      //fuerzarep.mult(0.1/es);
      acc.add(fuerzarep);
   }    
 }
 void resetbound(){
   if (loc.x > width+10){
     loc.x= 0-10;
   }
   if (loc.x < 0-10){
     loc.x = width+10;
   }
    if (loc.y > height+10){
     loc.y= 0-10;
   }
   if (loc.y < 0-10){
     loc.y = height+10;
   }
 }
}