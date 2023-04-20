class Base extends RadialObject{
  int hp = 10;
  
  
 Base(){
   position = new PVector(875,275);
   
   
   
   }
   void draw(){
     fill(#FF0303);
    ellipse(position.x, position.y, 25,25);
    noFill();
    
 }
}
