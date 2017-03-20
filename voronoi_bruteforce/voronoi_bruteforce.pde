city[] cities = new city[100];
int es=2;

void setup(){
  size(1600,900);
  for(int i=0; i<cities.length;i++){
    cities[i] = new city(random(0,width),random(0,height),random(0,255));
  }
}



void draw(){
  background(250);
  for(city c: cities){
    c.show();
    c.voronoitile(cities); //<>//
  }
}