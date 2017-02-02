//bola b;
bola[] bolas = new bola[5];
void setup() {
  size(640,360);
  for (int i=0; i<bolas.length; i++){
    bolas [i] = new bola(random(width), random(height));
  }
}

void draw() {
  background(51);
  loadPixels();
  for (int x=0; x < width; x++){
    for (int y=0; y < height; y++){
      int ind = x + y * width;
      float sum = 0;
      for(bola b: bolas){
        float c =125 * b.r / dist(x,y,b.pos.x,b.pos.y);
        sum = sum + c;
      }
      pixels[ind]=color(sum);
    }
  }  
  updatePixels(); 
  for (bola b: bolas){
    b.update();
   //b.show();
  }
}