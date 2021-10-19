int circlex, circley;
float diameter;
float minuteline;
float hourline;
int radius;
float clockD;

void setup(){
  size (800,600);
  stroke (255);
  
  radius = min(width, height)/2;
  minuteline = radius*0.75;
  hourline = radius*0.5;  
  
  circlex = width/2;
  circley = height/2;
  
  clockD = radius*1.5;
}

void draw(){
  background(255);
  fill(75);
  stroke(0);
  ellipse(circlex,circley,clockD,clockD);
  float minute = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
  float hour = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
  stroke(random(256),random(256),random(256));
  strokeWeight(2);
  line(circlex, circley, circlex + cos(minute) * minuteline, circley + sin(minute) * minuteline);
  strokeWeight(4);
  line(circlex, circley, circlex + cos(hour) * hourline, circley + sin(hour) * hourline);
  strokeWeight(3);
  beginShape(POINTS);
  for(int a=0;a<360; a+=30)
  {
    stroke (0,100,255);
    float angle = radians(a);
    float x = circlex + cos(angle) * minuteline;
    float y = circley + sin(angle) * minuteline;
    vertex(x,y);
  }
}
