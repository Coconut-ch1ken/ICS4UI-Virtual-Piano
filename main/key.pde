void drawKeys(){
  fill(0);
  textSize(32);
  textAlign(CENTER, CENTER);
  text("Press A, S, D, F, G, H, J, K to play piano keys", width / 2, 50);
  textSize(18);
  text("Pitch: " + pitch, width / 2, 85);
  //textSize(12);
  //text("Pressed Keys: " + join(typedKeys, " "), width/2, height-20);
  textSize(32);
  for ( int i = 0; i < keys.length; i++ ) {
    keys[i].display();
  }
}

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
