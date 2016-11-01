SpaceShip trek = new SpaceShip();
Star[] dot = new Star[200];
public void setup() 
{
  size(600, 600);
  for(int i=0;i<dot.length;i++){
    dot[i] = new Star();
  } 
}
public void draw() 
{
  background(0);
  trek.show();
  trek.move();
  for(int i=0;i<dot.length;i++){
    dot[i].show();
  }
}
public void keyPressed(){
  if(keyCode == UP)
  {
    trek.accelerate(5);
  }
  if(keyCode == RIGHT){
    trek.rotate(5);
  }
  if(keyCode == LEFT){
    trek.rotate(-5);
  }
  if(key == 32){
    trek.setX((int)(Math.random()*600));
    trek.setY((int)(Math.random()*600));
  }

}
class SpaceShip extends Floater  
{   

   public void setX(int x){myCenterX=x;}  
   public int getX(){return (int)myCenterX;}   
   public void setY(int y){myCenterY=y;}   
   public int getY(){return (int)myCenterY;}   
   public void setDirectionX(double x){myDirectionX=x;}   
   public double getDirectionX(){return myDirectionX;}   
   public void setDirectionY(double y){myDirectionY=y;}   
   public double getDirectionY(){return myDirectionY;}   
   public void setPointDirection(int degrees){myPointDirection=degrees;}  
   public double getPointDirection(){return myPointDirection;} 
   public SpaceShip(){
    myColor=color(255);
    corners =9;
    xCorners = new int[corners];
    yCorners = new int[corners];

    xCorners[0]=15;//tip
    yCorners[0]=0;
    xCorners[1]=10;//leftcorner
    yCorners[1]=-5;
    xCorners[2]=-5;//left second one
    yCorners[2]=-5;
    xCorners[3]=-10;//bottom left
    yCorners[3]=-10;
    xCorners[4]=-7;//vertex in left
    yCorners[4]=-5;
    xCorners[5]=-7;//vertex in right
    yCorners[5]=4;
    xCorners[6]=-10;//bottom right
    yCorners[6]=10;
    xCorners[7]=-5;//right second one
    yCorners[7]=5;
    xCorners[8]=10;//right corner
    yCorners[8]=5;
    
   


    myCenterX=300;
    myCenterY=300; 
    myDirectionX=0;
    myDirectionY=0;
    myPointDirection=0;    


   }
}
class Asteroid extends Floater
{
   public void setX(int x){myCenterX=x;}  
   public int getX(){return (int)myCenterX;}   
   public void setY(int y){myCenterY=y;}   
   public int getY(){return (int)myCenterY;}   
   public void setDirectionX(double x){myDirectionX=x;}   
   public double getDirectionX(){return myDirectionX;}   
   public void setDirectionY(double y){myDirectionY=y;}   
   public double getDirectionY(){return myDirectionY;}   
   public void setPointDirection(int degrees){myPointDirection=degrees;}  
   public double getPointDirection(){return myPointDirection;} 
   public Asteroid(){
    myColor=color(204, 204, 179);
    corners=5;
    xCorners = new int[corners];
    yCorners = new int [corners];

    xCorners[0]=-4;
    yCorners[0]=2;
    xCorners[1]=-1;
    yCorners[1]=3;
    xCorners[2]=2;
    yCorners[2]=2;
    xCorners[3]=4;
    yCorners[3]=0;
    xCorners[4]=2;
    yCorners[4]=-2;
    xCorners[5]=-2;
    yCorners[5]=-2;
    
   }


}
class Star{ 
  private int mySx,mySy;
  Star(){
    mySx=(int)(Math.random()*600);
    mySy=(int)(Math.random()*600);
  }
  public void show(){
    fill(255);
    ellipse(mySx,mySy,1,1);
  }
}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 

