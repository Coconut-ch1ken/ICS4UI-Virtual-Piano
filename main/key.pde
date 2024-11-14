class Key {
  PVector pos;
  PVector size;
  String note;
  color colour;
  boolean pressed;
  
  Key(float x, float y, float h, float v, String n, color c){
    this.pos = new PVector(x, y);
    this.size = new PVector(h, v);
    this.note = n;
    this.colour = c;
    this.pressed = false;
  }
  
   void display(){
     fill(this.colour);
     stroke(0);
     strokeWeight(2);
     rect(this.pos.x - this.size.x/2, this.pos.y - this.size.y/2, this.pos.x + this.size.x/2, this.pos.y + this.size.y/2);
     //println(this.pos.x + this.size.x/2, this.pos.y + this.size.y/2, this.pos.x - this.size.x/2, this.pos.y - this.size.y/2);
     noStroke();
     fill(0);
     text(this.note, this.pos.x, this.pos.y);
   }
}
