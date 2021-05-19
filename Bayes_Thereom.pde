float left = 100;
float hypothesis = 0.01;
float right = 20;
float hypothesisFalse = 0.99;

PImage a_texture;
PImage b_texture;
Area a, ah, b, bh;
void setup() {
  textureMode(NORMAL);
  textureWrap(REPEAT);
  noStroke();
  a_texture = loadImage("assets/snow.jpg");
  b_texture = loadImage("assets/snow2.jpg");
  println(Posterior());
  size(800, 800, P2D);

  float ax = map(left, 0, left+right, 0, width);
  float ay = map(hypothesis, 0, 1, height, 0);
  a = new Area(new PVector[] {new PVector(0, 0), new PVector(ax, 0), new PVector(ax, height), new PVector(0, height)});
  ah = new Area(new PVector[] {new PVector(0, ay), new PVector(ax, ay), new PVector(ax, height), new PVector(0, height)});

  float bx = map(left, 0, left+right, 0, width);
  float by = map(hypothesisFalse, 0, 1, height, 0);
  b = new Area(new PVector[] {new PVector(bx, 0), new PVector(width, 0), new PVector(width, height), new PVector(bx, height)});
  bh = new Area(new PVector[] {new PVector(bx, by), new PVector(width, by), new PVector(width, height), new PVector(bx, height)});
}

void draw() {
  background(0);
  a.show(color(250));
  ah.show(color(225));
  //a.lerp(ah, 0.1);


  b.show(color(25));
  bh.show(color(50));
  //b.lerp(bh, 0.1);
}

//P(H)
//Probability that the hypothesis holds before considering any new evidence.
float Prior() {
  float x = left/(left+right);
  println("Prior: " + x);
  return x;
}

//P(E|H)
//Probability of seeing the evidence if the hypothesis is true.
float Likelihood(float howMuch) {
  return howMuch;
}

//P(¬H)
//Probability that the hypothesis doesn't before considering any new evidence.
float PriorFalse() {
  float x = right/(left+right);
  println("Prior False: " + x);
  return x;
}

//P(E|¬H)
//Probability of seeing the evidence if the hypothesis is false.
float LikelihoodFalse(float howMuch) {
  return howMuch;
}

//P(H|E)
//This is your belief about the hypothesis after seeing the evidence.
float Posterior() {
  float numerator = Prior()*Likelihood(hypothesis);
  float denominator = Prior()*Likelihood(hypothesis)+PriorFalse()*LikelihoodFalse(hypothesisFalse);
  return numerator/denominator;
}
