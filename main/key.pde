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
  for ( int i = 0; i < keys2.length; i++ ) {
    keys2[i].display();
  }
  fill(150);
  rect(0, 420, width, 30);
  fill(255);
  textSize(20);
  text(join(notes, " "), 300, 435);
}

class Key {
  PVector pos;
  PVector size;
  String note;
  color colour;
  color text_colour;
  boolean pressed;
  
  Key(float x, float y, float h, float v, String n, color c, color t){
    this.pos = new PVector(x, y);
    this.size = new PVector(h, v);
    this.note = n;
    this.colour = c;
    this.text_colour = t;
    this.pressed = false;
  }
  
   void display(){
     fill(this.colour);
     stroke(0);
     strokeWeight(2);
     rect(this.pos.x, this.pos.y, this.size.x, this.size.y);
     noStroke();
     textSize(18);
     fill(this.text_colour);
     text(this.note, this.pos.x + this.size.x/2, this.pos.y + this.size.y/2);
   }
}
