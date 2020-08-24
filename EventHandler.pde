void keyPressed() {
  if (key==CODED) {
    PVector newDirection=new PVector(0,0);
    if (keyCode==UP) {
      newDirection.y-=1;
    } 
    else if (keyCode==DOWN) {
      newDirection.y+=1;
    } 
    else if (keyCode==LEFT) {
      newDirection.x-=1;
    } 
    else if (keyCode==RIGHT) {
      newDirection.x+=1;
    }
    gameManager.updateSnakeDirection(newDirection);
  }
  else{
    gameManager.reset();
  }
}
