// Key dimensions
float whiteKeyWidth; // Width of white keys
float blackKeyWidth; // Width of black keys
int keyHeight = 150; // Constant height for all keys
float keyboardTopY = 450; // Adjust this value to move the keyboard up or down

void initializeKeys() {
  // Initialize white keys
  for (int i = 0; i < keys.length; i++) {
    keys[i] = new Key(i * whiteKeyWidth, keyboardTopY, whiteKeyWidth, keyHeight, noteNames[i], color(255), color(0));
  }
  
  // Initialize black keys
  for (int i = 0; i < keys2.length; i++) {
    float xOffset;
    if (i < 2) { xOffset = 60 + i * whiteKeyWidth; } 
    
    else { xOffset = 60 + (i + 1) * whiteKeyWidth; }
    
    xOffset += whiteKeyWidth / 5; // Center the black key between adjacent white keys

    keys2[i] = new Key(xOffset, keyboardTopY, blackKeyWidth, keyHeight * 0.5, noteNames2[i], color(0), color(255));
  }
}


void drawKeys(){
  fill(0);
  textSize(24);
  textAlign(CENTER, CENTER);
  text("Press A, S, D, F, G, H, J, K to play white keys", width / 2, 20);
  text("Press W, E, T, Y, U to play black keys", width / 2, 50);
  textSize(16);
  text("Pitch: " + pitch + "         Metronome BPM: " + bpm, width / 2, 80 );
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
