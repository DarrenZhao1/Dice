int Y_AXIS = 1;
int X_AXIS = 2;
color b1, b2, c1, c2;

Die jeff;
  int TOTAL = 0;
  void setup()
  {
      size (800, 800);
      noLoop();
  }
  void draw(){
      
  //background(0,0,0);
  c1 = color (204, 0, 51);
  c2 = color (51, 156, 204);
  setGradient(0, 0, 800, 800, c1, c2, Y_AXIS);
  setGradient(0, 0, 800, 800, c2, c1, X_AXIS);
  noStroke();
  for(int f = 0; f < 700; f+=120)
  {
    for(int e = 0; e < 700; e+=120)
    {
        jeff = new Die(50 + f, 15 + e);
        jeff.roll();
        jeff.show();
    }
  }
  textSize(40);
  fill(255);
  text ("Total: ", 300, 760);
  text (TOTAL, 420, 760);
  }
  
  void mousePressed()
  {
      TOTAL = 0;
      redraw();
  }
  class Die //models one single dice cube
  {
      int dValue, dX, dY, c1x, c1y, c2x, c2y, c3x, c3y, 
      c4x, c4y, c5x, c5y, c6x, c6y, c7x, c7y;
      
      Die(int x, int y) //constructor
      {
          dValue = 0;
          dX = x;
          dY = y;
          //mid
          c1x = x + 48;
          c1y = y + 47;
          //mid left
          c2x = x + 20;
          c2y = y + 47;
          //mid right
          c3x = x + 75;
          c3y = y + 47;
          // top left 
          c4x = x + 20;
          c4y = y + 20;
          //bottom left
          c5x = x + 20;
          c5y = y + 77;
          //top right
          c6x = x + 75;
          c6y = y + 20;
          //bottom right
          c7x = x + 75;
          c7y = y + 77;
          
          //replace for variables
      }
      void roll()
      {
          dValue = (int)((Math.random()*6) +1);
          TOTAL = TOTAL + dValue;
      }
      void show()
      {   if (dValue == 6){
          fill(255, 255, 255);
          rect(dX, dY, 100, 100);
          fill(0, 0, 0);
          ellipse(c4x, c4y, 20, 20);
          ellipse(c2x, c2y, 20, 20);
          ellipse(c5x, c5y, 20, 20);
          ellipse(c6x, c6y, 20, 20);
          ellipse(c3x, c3y, 20, 20);
          ellipse(c7x, c7y, 20, 20);
          }
          if (dValue == 5){
          fill(255, 255, 255);
          rect(dX, dY, 100, 100);
          fill(0, 0, 0);
          ellipse(c4x, c4y, 20, 20);
          ellipse(c3x, c4y, 20, 20);
          ellipse(c1x, c1y, 20, 20);
          ellipse(c5x, c5y, 20, 20);
          ellipse(c7x, c7y, 20, 20);
          }
          if (dValue == 4){
          fill(255, 255, 255);
          rect(dX, dY, 100, 100);
          fill(0, 0, 0);
          ellipse(c4x, c4y, 20, 20);
          ellipse(c5x, c5y, 20, 20);
          ellipse(c6x, c6y, 20, 20);
          ellipse(c7x, c7y, 20, 20);
          }
          if (dValue == 3){ 
          fill(255, 255, 255);
          rect(dX, dY, 100, 100);
          fill(0, 0, 0);
          ellipse(c2x, c2y, 20, 20);
          ellipse(c1x, c1y, 20, 20);
          ellipse(c3x, c3y, 20, 20);
          }
          if (dValue == 2){
          fill(255, 255, 255);
          rect(dX, dY, 100, 100);
          fill(0, 0, 0);
          ellipse(c2x, c2y, 20, 20);
          ellipse(c3x, c3y, 20, 20);
          }
          if (dValue == 1){
          fill(255, 255, 255);
          rect(dX, dY, 100, 100);
          fill(0, 0, 0);
          ellipse(c1x, c1y, 20, 20);
          }
          
      }
  }
  void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {

  noFill();

  if (axis == Y_AXIS) {  // Top to bottom gradient
   for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }
  }
