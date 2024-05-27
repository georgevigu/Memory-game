public class Card{

PImage front,back;
boolean faceup;

public Card(){
  back = loadImage("card_back.png");
  faceup= false;
}

public void functie(int x, int y)
{
  if(faceup)
  {
    image(this.front,x,y);
  }
  else
  {
    image(this.back,x,y);
  }
}

}
