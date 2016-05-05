
//***declare
Player p;
ArrayList platforms;
boolean  a,  d;
int score, fallCount;
boolean gameOver;
 
void setup()
{
  size(320, 480);
  initialize();
}
  
void initialize()
{
  score = 0;
  fallCount = 0;
  gameOver = false;
  p = new Player(width/2, height/2);
  platforms = new ArrayList();    //all my platforms
  platforms.add(new MovingPlatform(20,80,70,8));
  platforms.add(new Platform(100,420,100,8));
  platforms.add(new Platform((int)random(10,200),320,100,8));
  platforms.add(new Platform((int)random(10,200),220,100,8));
  platforms.add(new Platform((int)random(10,200),120,100,8));
  platforms.add(new Platform((int)random(10,200),20,100,8));
}
     //***call functionality
void draw()
{
  //println(score);
  background(204);
   text("Score: "+score,20,20);
  for(int i=0; i<platforms.size(); i++)
 
  {
 
    p.collide((Platform)platforms.get(i));
    ((Platform)platforms.get(i)).display();
    ((Platform)platforms.get(i)).move();
  }
  p.display();
  p.move();
  
  adjustView();
  clearOld();
  NewPlatforms();
  if (platformsBelow() == 0) gameOver = true;
  if (gameOver) fallCount++;
  if (fallCount > 90 ) initialize();//gameover
 if (gameOver) text("Score: "+ score,(width/2)-20,height/2);
 
}
 
int platformsBelow()

{
  int count = 0;
  for(int i=0; i<platforms.size(); i++)
  {
    if (((Platform)platforms.get(i)).y >= p.y) count++;
  }
  
  return count;
}
  
void adjustView()//moving view
{
  // above midpoint
  float overHeight = height * 0.5 - p.y;
  if(overHeight > 0)
  {
    p.y += overHeight;
    for(int i=0; i<platforms.size(); i++)
    {
      ((Platform)platforms.get(i)).y += overHeight;
    }
    score += overHeight;
  }
  // falling
  float underHeight = p.y - (height-p.h-4);
  if(underHeight > 0)
  {
    p.y -= underHeight;
    for(int i=0; i<platforms.size(); i++)
    {
      ((Platform)platforms.get(i)).y -= underHeight;
    }
  }
}
  
void clearOld()
{
  for(int i=platforms.size()-1; i>=0; i--)
  {
    // scrolled off the bottom
    if(((Platform)platforms.get(i)).y > height)
    {
      platforms.remove(i);
    }
  }
}
  
void NewPlatforms()
{
  if(platforms.size() < 7)
  {
    if(random(0,10) < 2) platforms.add(new MovingPlatform((int)random(10,width-80),-10,70,8));
    else platforms.add(new Platform((int)random(20,200),-10,70,8));
  }
 
}
  
void keyPressed()//controls
{
 
  if (key == 'a') a = true;
  if (key == 'd') d = true;
}
  
void keyReleased()
{

  if (key == 'a') a = false;
  if (key == 'd') d = false;
}