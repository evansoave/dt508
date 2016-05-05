class Platform
{
  //global variables
  float x,y,w,h;
  float xvel, yvel;
  //constructor
  Platform(int x, int y, int w, int h)
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  //functionality
  void display()
  //platform draw
  {
    fill(0,0,200);
    rect(x,y,w,h,10);
  }
  
  void move()
  {
    x += xvel;
    y += yvel;
  }
  
}
  