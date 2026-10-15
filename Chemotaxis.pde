Atom[] iron;
boolean ready = false;
void setup(){
  size(300,300);
  //iron = new Atom();
  iron = new Atom[100];
  for(int i = 0; i < iron.length; i++){
    iron[i] = new Atom();
  }  
}

void mouseClicked(){
  ready = true;
}

void draw(){
  frameRate(200);
  background(0);
  //iron.move();
  //iron.show();
  for(int i = 0; i < iron.length; i++){
    iron[i].show();
  }
  if(ready == true){
    for(int i = 0; i < iron.length; i++)
      iron[i].move();
  }
  fill(0,0,255);
  rect(mouseX - 10, mouseY - 2, 20, 4);
  fill(255,0,0);
  rect(mouseX, mouseY - 2, 10, 4);
}

class Atom{
  int myX, myY, c;
  Atom(){
    myX = (int)(Math.random()*300);
    myY = (int)(Math.random()*300);
    c = color(255,255,255);
  }
  void move(){
    if(dist(myX,myY,mouseX+10,mouseY) < dist(myX,myY,mouseX-10,mouseY)){
      c = color(255,110,110);
      if(myX > mouseX + 10)
        myX = myX - ((int)(Math.random()*5)-1);
      if(myY > mouseY + 2)
        myY = myY - (int)(Math.random()*5)-1;
      else
        myY = myY + (int)(Math.random()*5)-1;
    }
    else{
      c = color(110,110,255);
      if(myX < mouseX - 10)
        myX = myX + ((int)(Math.random()*5)-1);
      if(myY > mouseY + 2)
        myY = myY - (int)(Math.random()*5)-1;
      else
        myY = myY + (int)(Math.random()*5)-1;
    }
  }
  void show(){
    noStroke();
    fill(c);
    ellipse(myX, myY, 5, 5);
  }
}
