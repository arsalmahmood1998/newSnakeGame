Manager gameManager;
void setup() {
  size(500, 500);
  gameManager=new Manager();
}
void draw() {
  background(0, 255, 255);
  gameManager.displayGame();
  gameManager.moveGame();
}
