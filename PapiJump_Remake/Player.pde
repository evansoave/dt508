class Player
{
  //Global Variables
  static final float fall = 0.14;
  static final float bounce = 6.1;
  static final float maxYVel = 12;  //stop ball from speeding up
  static final float maxXVel = 2;  //stop ball from speeding up
  
  float x, y, xVel, yVel;
  int w, h;
  // constructor called once
  Player(int x, int y)
  {
    this.x = x;
    this.y = y;
    w = h = 20;
  }
   //functionality
   void display()
  {
    fill(204,0,0);
    ellipse(x,y,w,h);
  }
 
  void move() //functionality
  {
    x += xVel;
    y += yVel;
  
    // (player enters left exit right vice versa)
    if (x > width-w) x = 0;
    if (x < 0) x = width-w;
  
    // horizontal
    if (!gameOver)
    {
      if (a) xVel -= 0.1;
      else if (d) xVel += 0.1;
      else
      {
        if (xVel > 0) xVel -= 0.03;
        else  xVel += 0.03;
      }
    }
    if (abs(xVel) < 0.01) xVel = 0;
    xVel = min(maxXVel, xVel);
    xVel = max(-maxXVel, xVel);
  
    // vertical
    yVel += fall;
    yVel = min(maxYVel, yVel);
    yVel = max(-maxYVel, yVel);
  }
  
  void collide(Platform p)
  {
    // standard rectangle intersections, but only for our lowest quarter
    if(x         < p.x + p.w &&
      x + w      > p.x       &&
      y+h/2+h/4  < p.y + p.h &&
      y + h      > p.y)
    {
      // only care aboubut we t platforms when falling
      if (yVel > 0) {
        // for bouncing
        yVel = -bounce;
      }
    }
  }
  
}
 