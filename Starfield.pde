class Particle
{
  double myX,myY,mySpeed,myAngle,mySize;
  int myColor,myColors,myOpacity;
  Particle()
  {
    myX = 400;
    myY = 400;
    mySpeed = (Math.random()*6)-4;
    mySize = (Math.random()*15)-9;
    myAngle = (Math.random()*3)*Math.PI;
    myColor = 255;
    myColors = #7df9ff;
    myOpacity = (int)(Math.random()*300)-50;
  }
  void move()
  {
    if ((myX > 2000||myX<-1000)||(myY > 2000||myY<-1000)){
      myX = 400;
      myY = 400;
      mySpeed = (Math.random()*2);
    }
    myX = myX + cos((float)myAngle)*mySpeed;
    myY = myY + sin((float)myAngle)*mySpeed;
  }
  void show()
  {
    noStroke();
    fill (myColors,myOpacity);
    ellipse((float)myX,(float)myY,(float)mySize+1,(float)mySize+1);
    fill (myColor,myOpacity);
    ellipse((float)myX,(float)myY,(float)mySize,(float)mySize);
  }
}
class OddballParticle extends Particle
{
  OddballParticle(){
    myX = 400;
    myY = 400;
    mySize = 0;
    myColor = myColors = #fcf787;
  }
    void move()
  {
    mySpeed = 0;
    myX = myX + (Math.random()*6)-3;
    myY = myY + (Math.random()*6)-3;
  }
  void show()
  {
    noStroke();
    fill (myColor);
    ellipse((float)myX,(float)myY,(float)mySize,(float)mySize);
    triangle((float)myX,(float)myY-25,(float)myX-20,(float)myY+20,(float)myX+10,(float)myY+10);
    triangle((float)myX-25,(float)myY-10,(float)myX+25,(float)myY-10,(float)myX,(float)myY+10);
    triangle((float)myX,(float)myY-25,(float)myX-10,(float)myY+10,(float)myX+20,(float)myY+20);
  }
}

Particle [] bob = new Particle [1000];

void setup(){
  size (800,800);
  for (int i=0; i<bob.length; i++){
    bob[i]=new Particle();
  }
   for (int i=0; i<3; i++){
    bob[i]= new OddballParticle();
  }
}

void draw(){
  background (0);
  for (int i = 0; i<bob.length; i++){
   bob[i].move();
   bob[i].show();
  }
}
