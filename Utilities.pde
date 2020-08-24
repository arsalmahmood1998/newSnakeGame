boolean collissionTest(PVector testPoint, PVector anotherTestPoint, float givenDistance) {
  boolean result=false;
  if (dist(testPoint.x, testPoint.y, anotherTestPoint.x, anotherTestPoint.y)<=givenDistance) {
    result=true;
  }
  return result;
}
boolean collissionTest(ArrayList<PVector> testList, PVector testPoint, float givenDistance) {
  boolean result=false;
  int i=0;
  while (i<testList.size() && result==false) {
    PVector newPoint=testList.get(i);
    if (collissionTest(newPoint, testPoint, givenDistance)) {
      result=true;
    }
    i++;
  }
  return result;
}
