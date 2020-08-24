class Food extends PVector {
  float radius;
  color foodColor=color(random(255), random(255), random(255));
  Food( float _radius) {
    super(random(_radius, width-_radius), random(_radius+40, height-_radius));
   
    radius=_radius;
  }
  void display() {
    pushStyle();
    fill(foodColor);
    stroke(red(0), green(0), blue(0), 100);
    strokeWeight(2);
    circle(x, y, radius*2);
    popStyle();
  }
} 
