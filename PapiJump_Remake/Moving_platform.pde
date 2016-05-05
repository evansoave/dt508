class MovingPlatform extends Platform
{
  //global variables
  static final float speed = 0.9;
    //constructor
  MovingPlatform(int x, int y, int w, int h)
  {
    super(x, y, w, h);
    this.xvel = speed;
  }
    
  void move()
  {
    super.move();
    if( (x+w > width - 10) || (x < 10) )
    {
      xvel *= -1;
    }
  }
}
 //functionality used from superclass Platform