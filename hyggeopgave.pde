float ellipseX;
float ellipseY;
float xVel = 4;
float yVel = 4;
float ellipseSizeX = 50;
float ellipseSizeY = 50;
float rectX;
float rectY;
int score = 0;

void setup() {
  fullScreen();
  frameRate(120);
  
  ellipseX = width/2;
  ellipseY = height/2;
  
  rectX = random(50, width-50);
  rectY = random(50, height-50);
}


void draw() {
  background(255, 233, 173);
//Runs the function that checks if rect touches ellipse
  if (isInsideCircle(ellipseX, ellipseY, ellipseSizeX/2, rectX, rectY)) {
    rectX = random(50, width-50);
    rectY = random(50, height-50);
    score++;
    ellipseSizeX = ellipseSizeX + 10;
    ellipseSizeY = ellipseSizeY + 10;
  }
  
  //Drawings
  fill(187, 255, 128);
  strokeWeight(2);
  rect(rectX, rectY, 10, 10);


  fill(179, 217, 255);
  strokeWeight(3);
  ellipse(ellipseX, ellipseY, ellipseSizeX, ellipseSizeY);
  
  fill(0);
  textSize(52);
  text("Score: " + score, 20, 50);
  
  textSize(12);
  text("FPS: " + round(frameRate), width-60, 15);


  //Ball controls
  if (keyCode == RIGHT) {
    ellipseX = ellipseX + xVel;
  }

  if (keyCode == LEFT) {
    ellipseX = ellipseX - xVel;
  }

  if (keyCode == UP) {
    ellipseY = ellipseY - yVel;
  }

  if (keyCode == DOWN) {
    ellipseY = ellipseY + yVel;
  }


  //Wall mechanics
  if (ellipseX > width) {
    ellipseX = 0;
  } else if (ellipseX < 0) {
    ellipseX = width;
  }


  if (ellipseY > height) {
    ellipseY = 0;
  } else if (ellipseY < 0) {
    ellipseY = height;
  }
}




//Distance check function
float distance(float p1x, float p1y, float p2x, float p2y) {

  float a = abs(p1x-p2x);
  float b = abs(p1y-p2y);
  float c = sqrt(a*a + b*b);
  return c;
}
//Checks if point collide with ellipse
boolean isInsideCircle(float cx, float cy, float r, float px, float py) {

  return distance(cx, cy, px, py) <= r;
}
