
float angle = 0;

int w = 80;

int cols;
int rows;

Curve[][] curves;

void setup()
{
  size (1080,1080,P2D);
  cols = (width / w) - 1;
  rows = (height / w) - 1;
  curves = new Curve[rows][cols];
  for(int i = 0; i < rows; i++)
  for(int j = 0; j < cols; j++)
  {
    curves[i][j] = new Curve();
  }
}

void draw()
{
  background(0,0,0);
  float dia = w - 10;
  float r = dia/2;
  noFill();
  for (int i = 0; i < cols; i++){
    float cx = w + (i * w) + (w / 2);
    float cy = w/2;
    stroke(255);
    strokeWeight(1);
    ellipse(cx,cy,dia,dia);
    
    float x = r * cos((angle*(i+1)) - HALF_PI);
    float y = r * sin((angle*(i+1)) - HALF_PI);
    strokeWeight(8);
    stroke(255);
    point(cx+x,cy+y);
    
    stroke(255,100);
    strokeWeight(1);
    line(cx + x, 0, cx + x, height);
    
    for(int j = 0; j < rows; j++)
    curves[j][i].addX(cx + x);
  }
  
    for (int j = 0; j < rows; j++){
    float cy = w + (j * w) + (w / 2);
    float cx = w/2;
    stroke(255);
    strokeWeight(1);
    ellipse(cx,cy,dia,dia);
    
    float x = r * cos((angle*(j+1)) - HALF_PI);
    float y = r * sin((angle*(j+1)) - HALF_PI);
    strokeWeight(8);
    stroke(255);
    point(cx+x,cy+y);
    
    stroke(255,100);
    strokeWeight(1);
    line(0, cy + y, width, cy+y);
    for(int i = 0; i < cols; i++)
    curves[j][i].addY(cy + y);
  }
  for(int i = 0; i < rows; i++)
  for(int j = 0; j < cols; j++)
  {
    curves[i][j].addPoint();
    curves[i][j].show();
  }
  angle -= 0.001;
  if(angle < -TWO_PI)
  {
    for(int i = 0; i < rows; i++)
    for(int j = 0; j < cols; j++)
    {
      curves[i][j].reset();
    }
    saveFrame("lissa.png");
    angle = 0;
  }
}
