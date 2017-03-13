boid[] boids = new boid[2500];
flowfield flow = new flowfield(2);

void setup() {
  size(1600,900); 
  for(int i=0; i<boids.length; i++){
  boids[i]=new boid(random(width),random(height),random(0.02,0.1));
  }
}

void draw(){
  background(250);
  text(boids.length,20,20);
  text(frameRate,20,40);
  for (boid b: boids){
  b.seek(flow);
  //b.repel(boids);
  b.update();
  b.disp();
  b.resetbound();
  }
}