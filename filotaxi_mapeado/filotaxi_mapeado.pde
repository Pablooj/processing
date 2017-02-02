float c = 5;
float ang = 137.5;
float max = 2500;
float ell=3;
void setup(){
  size(640,640);
  //colorMode(HSB)
}

void draw(){
 background(51);
 translate(width/2,height/2);
 for(int n = 0; n < max; n++){
   float phi = n * ang;
   float r = c * sqrt(n);
   noStroke();
   float colmap = phi % 260;
   //float colmap = phi % map(mouseX,0,width,0,360);
   //float colmap =r % map(mouseX,0,width,0,c*sqrt(max));
   float g=colmap/map(mouseX,0,width,10,1);
   float b=colmap/map(mouseY,0,height,10,1);
   fill(colmap,g,b);
   ellipse(r * cos(radians(phi)), r*sin(radians(phi)), ell* 2, ell* 2);
 }
}