
PImage[] imgs = new PImage[10];
int[] numb = new int[10];
int counter = 0;
int rand;
int maxCounter = 20;
int y, x, a, b, z = 0, c, d, scor = 0;
boolean trebuieSchimbat = false;
Card[] vector = new Card[20];
boolean wait = false;
int waitStartTime;

void setup() {
  size(500, 500);
  background(0);

  for (int i = 0; i < 10; i++) {
    String imgName = "image" + (i + 1) + ".png";
    imgs[i] = loadImage(imgName);
    frameRate(60);
  }

  while (counter < 20) {
    rand = (int) random(0, 10);
    if (numb[rand] < 2) {
      vector[counter] = new Card();
      numb[rand]++;
      vector[counter].front = imgs[rand];
      counter++;
    }
  }
  counter = 0; // Reset counter after initialization
}

void draw() {
  background(0);

  for (int i = 0; i < 20; i++) {
    y = i / 5;
    x = (i * 100) % 500;
    if (i % 5 == 0) {
      x = 0;
    }
    vector[i].functie(x, y * 100);
  }
  textSize(50);
  text("Score: " + scor,50,450);
  
  if(scor==10){
    textSize(50);
    fill(#32CD32);
    text("Ai câștigat!",250,450);
  }

  if (wait) {
    if (millis() - waitStartTime >= 1000) { // Așteaptă 1 secundă
      vector[c].faceup = false;
      vector[d].faceup = false;
      wait = false;
      z = 0; 
    }
  }
}

void mousePressed() {
  if (wait) return; 

  a = mouseX / 100;
  b = mouseY / 100;
  vector[a + (b * 5)].faceup = true;
  if (z == 0) {
    c = a + (b * 5);
    z++;
  } else if (z == 1) {
    d = a + (b * 5);
    if (vector[c].front == vector[d].front) {
      scor++;
      z = 0; 
    } else {
      wait = true; 
      waitStartTime = millis(); 
    }
  }
}
