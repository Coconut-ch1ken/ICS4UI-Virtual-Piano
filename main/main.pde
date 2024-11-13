import ddf.minim.*;
import g4p_controls.*;

Minim minim;

AudioPlayer[] pianoKeys = new AudioPlayer[7];
String keyNames[] = {"A","B","C","D","E","F","G"};

int[] keyCodes = {65, 83, 68, 70, 71, 72, 74};  
boolean[] keyStates = new boolean[7];

void setup(){
  
  size(600,600);
  minim = new Minim(this);
  
    // Load piano sound files
  for (int i = 0; i < keyNames.length; i++) {
    pianoKeys[i] = minim.loadFile(keyNames[i] + ".mp3");
  }
  
  background(255);
}

void draw() {
  background(255);
  fill(0);
  textSize(32);
  textAlign(CENTER, CENTER);
  text("Press A, S, D, F, G, H, J to play piano keys", width / 2, height / 2 - 40);
  pianoKeys[3].play();
  // Draw simple visual representation of keys (like rectangles)
  for (int i = 0; i < keyNames.length; i++) {
    fill(200);
    rect(50 + i * 50, height / 2 + 40, 40, 100);
    fill(0);
    text(keyNames[i], 50 + i * 50 + 20, height / 2 + 90);
  }
}

void keyPressed() {
  // Check if the key pressed is mapped to a piano note
  for (int i = 0; i < keyCodes.length; i++) {
    if (key == keyCodes[i] && !keyStates[i]) {
      pianoKeys[i].rewind();  // Rewind the sound to the start (in case it's already playing)
      pianoKeys[i].play();    // Start playing the sound
      keyStates[i] = true;    // Mark this key as being pressed
    }
  }
}

void keyReleased() {
  // Stop the sound when the key is released
  for (int i = 0; i < keyCodes.length; i++) {
    if (key == keyCodes[i] && keyStates[i]) {
      pianoKeys[i].pause();  // Pause the sound (instead of stopping it completely)
      keyStates[i] = false;  // Mark this key as released
    }
  }
}

void stop() {
  // Close Minim when the sketch ends
  for (int i = 0; i < pianoKeys.length; i++) {
    pianoKeys[i].close();
  }
  minim.stop();
  super.stop();
}
  
  
  
  
