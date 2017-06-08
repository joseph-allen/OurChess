void setup(){
  background(0);
  size(800, 800);
}

void draw(){
  background(0);
  for(float i = 0; i < 800; i = i + 99.999)
  {
    strokeWeight(4);
    stroke(125,50,50);
    line(i,0,i,height);
    line(0,i,width,i);
  }
} 
