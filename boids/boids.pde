boid[] boids = new boid[200];

void setup() {
  size(1024,576); 
  for(int i=0; i<boids.length; i++){
  boids[i]=new boid(random(width),random(height),random(0.01,0.1));
  }
}

void draw(){
  background(51);
  for (boid b: boids){
  b.seek();
  b.update();
  b.disp();
  }
}