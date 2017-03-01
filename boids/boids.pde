boid[] boids = new boid[50];

void setup() {
  size(1024,576); 
  for(int i=0; i<boids.length; i++){
  boids[i]=new boid(random(width),random(height),random(0.02,0.1));
  }
}

void draw(){
  background(250);
  for (boid b: boids){
  b.seek();
  b.repel(boids);
  b.update();
  b.disp();
  }
}