class Cheese {
  int x;
  int y;
  boolean isActive; // also isActive. the chees is displayed and the mouse is en rute.
  int remaining; // the amount of cheese remainig int tau /8 
  
  Cheese(){
    this.x = -10;
    this.y = -10;
    this.isActive = false;
    remaining = 8;
  }
  
  Cheese(int x, int y){
    this();
    place(x, y);
  }
  
  void render(){
    fill(#FFFF00);
    arc(x, y, 40,40,0, (TAU/8)*remaining, PIE );    
  }
  
  void eat(){
    remaining--;
    if(remaining <0){
      remaining = 8;
      isActive = false;
    } 
  }
  
  void place(int x, int y){
    this.x = x;
    this.y = y;
    isActive = true;
  }
  
}
