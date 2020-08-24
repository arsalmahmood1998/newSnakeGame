class Snake {
  ArrayList <PVector> points;
  PVector direction;
  float headX, headY;
  int pointsCount;

  Snake(float _headX, float _headY, int _pointsCount) {
    points=new ArrayList <PVector>();
    direction=new PVector(0, 0);
    headX=_headX;
    headY=_headY;
    pointsCount=_pointsCount;
    create();
  }
    void disPlay() {
    for ( PVector point : points) {
      pushStyle();
      stroke(255, 0, 0);
      strokeWeight(5);
      point(point.x, point.y);
      popStyle();
    }
    pushStyle();
    fill(255,0,0);
    textSize(40);
    textAlign(CENTER,CENTER);
    text("Snake",250,20);
  }
  void create() {
    points.add(new PVector(headX, headY));
    for (int i=1; i<pointsCount; i++) {
      points.add(new PVector(headX-i, headY));
    }
  }  
  void move() {
    if (!(direction.x==0 && direction.y==0)) {
      for (int i=points.size()-1; i>0; i--) {
        points.get(i).x=points.get(i-1).x;
        points.get(i).y=points.get(i-1).y;
      }
      points.get(0).x+=direction.x;
      points.get(0).y+=direction.y;
    }
    if (points.get(0).x<0) {
      points.get(0).x=width;
    } else if (points.get(0).x>width) {
      points.get(0).x=0;
    } else if (points.get(0).y<0) {
      points.get(0).y=height;
    } else if (points.get(0).y>height) {
      points.get(0).y=0;
    }
  }
  void updateDirection(PVector newDirection) {
    if (newDirection.x != direction.x ||newDirection.y != direction.y ) {
      if (points.get(0).x + newDirection.x != points.get(1).x) {
        direction.x=newDirection.x;
      }
      if (points.get(0).y + newDirection.y != points.get(1).y) {
        direction.y=newDirection.y;
      }
    }
  }
  void increaseLength(float newLength) {
    PVector lastPoint=points.get(points.size()-1);
    PVector secondLastPoint=points.get(points.size()-2);
    float finalLength=newLength;
    PVector tailDirection= PVector.sub(lastPoint, secondLastPoint);
    for (int i=0; i<finalLength; i++) {
      lastPoint=points.get(points.size()-1);
      PVector newPoint =PVector.add(lastPoint,tailDirection);
      points.add(newPoint);
    }
  }
}
