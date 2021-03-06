class Speedo
{
  float x1 = width + 150;
  float y1 = -150;
  float speed = 113;
  //max 156 min 113
  void render()
  {
     pushMatrix();
  translate(0, 0, + 2);
    strokeWeight(3);
    stroke(255,0,0);
    line(width -320, 5, width - 290, 5);
    line(width - 275, 100, width -250, 87);
    stroke(255);
    line(width - 5, 320, width - 5, 290);
    line(width - 200, 200,width - 180,180);
    line(width - 100, 275, width - 87 , 250);
    noFill();
    strokeWeight(10);
    stroke(0,255,0);
    arc(x1,y1,800,800,radians(90),radians(speed));
    stroke(0,255,255);
    arc(x1,y1,650,650,radians(90),radians(speed));
    stroke(0,120,255);
    arc(x1,y1,500,500,radians(90),radians(speed));
    popMatrix();
  } 
  void update()
  {
    if(speed > 113)
    {
     speed -= 0.1; 
    }
    if(keyPressed == true)
    {
      if(key == 'w')
      {
        if(speed < 156 && noFuel == 0)
      {
          speed += 0.5;
        }
      }
    }
    if(speed >= 153)
    {
      fill(255,200,0);
      textSize(30);
      text("warning:\nWARP SPEED",width - 350,320);
      warp_back = 1;
      background = -background;
    }   
    else if(speed < 153)
    {
      warp_back = 0;
    }
  }
}