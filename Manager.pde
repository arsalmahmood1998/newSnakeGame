class Manager {
  Snake snake;
  ArrayList <PVector> foods;
  float foodRadius;
  int score=0;
  Manager() {
    foodRadius=10;
    snake=new Snake(width/2, height/2, 100);
    foods=new ArrayList <PVector>();
    reset();
  }
  void displayGame() {
    snake.disPlay();
    displayScore();
    for (PVector myFood : foods) {
      Food newFood=(Food) myFood;
      newFood.display();
    }
  }
  void displayScore() {
    pushStyle();
    fill(255, 0, 0);
    textSize(30);
    textAlign(CENTER, CENTER);
    text("Score="+score, 70, 20);
    popStyle();
  }
  void gameOverMessage() {
    pushStyle();
    fill(255, 0, 0);
    stroke(5);
    textSize(70);
    textAlign(CENTER, CENTER);
    text("Game Over..!", width/2, height/2);
    popStyle();
  }
  void reset() {
    foods.clear();
    snake.points.clear();
    snake.create();
    snake.direction=new PVector(0, 0);
    addFood();
    score=0;
  }
  void moveGame() {
    snake.move();
    getFood();
    isGameOver();
  }
  void updateSnakeDirection( PVector newDirection) {
    snake.updateDirection(newDirection);
  }
  void addFood() {
    int foodsCount=10;
    foods.add(new Food(foodRadius));
    for (int i=0; i<foodsCount-1; i++) {
      Food myFood=new Food(foodRadius);
      boolean isCollidingWithOldFood=collissionTest(foods, myFood, foodRadius*2);
      boolean isCollidingWithSnake= collissionTest(snake.points, myFood, foodRadius*2);
      if (!isCollidingWithSnake && !isCollidingWithOldFood) {
        foods.add(myFood);
      } 
      else {
        i--;
      }
    }
  }
  void getFood() {
    for (int i=foods.size()-1; i>=0; i--) {
      if (collissionTest(foods.get(i), snake.points.get(0), foodRadius)) {
        foods.remove(foods.get(i));
        score+=2;
        snake.increaseLength(score*2.5);
        println(snake.points.size());
      }
    }
    if (foods.size()==0) {
      addFood();
    }
  }
  void isGameOver() {
    for (int i=1; i<snake.points.size(); i++) {
      if (collissionTest(snake.points.get(i), snake.points.get(0), 0)) {
        updateSnakeDirection(new PVector(0, 0));
        gameOverMessage();
      }
    }
  }
}
