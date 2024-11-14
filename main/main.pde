import ddf.minim.*;
import g4p_controls.*;

Minim minim;
int pitch;

AudioPlayer[] pianoKeys = new AudioPlayer[8];
String keyNames[] = {"C","D","E","F","G","A","B","C'"};

char[] keyCodes = {'a', 's', 'd', 'f', 'g', 'h', 'j','k'};
char pitchdown = '-';
char pitchup = '=';

boolean[] keyStates = new boolean[8];

int keyPitch[] = {1,2,3,4,5,6,7};

void setup(){
  
  size(600,600);
  minim = new Minim(this);
  pitch = 4;
  
   //  Load piano sound files
  loadNotes();
  
  background(255);
}

void draw() {
  background(255);
  fill(0);
  textSize(32);
  textAlign(CENTER, CENTER);
  text("Press A, S, D, F, G, H, J to play piano keys", width / 2, height / 2 - 40);
  textSize(18);
  text("Pitch: " + pitch, width / 2, height / 2 - 10);
 
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
      pianoKeys[i].play(); 
      println("I pressed " + keyNames[i] + pitch);// Start playing the sound
      keyStates[i] = true;    // Mark this key as being pressed
    }
  }
  if (key == pitchdown){
    pitch--;
    
    if (pitch < 1){pitch = 1;}
    loadNotes();
  } else
  if (key == pitchup){
    pitch++;
    
    if (pitch > 7){pitch = 7;}
    loadNotes();
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
  
  
void loadNotes(){
  for (int i = 0; i < keyNames.length; i++) {
    pianoKeys[i] = minim.loadFile(keyNames[i]+ str(pitch) + ".mp3");
  }  
  if(pitch != 7){
    pianoKeys[7] = minim.loadFile("C"+str(pitch+1)+".mp3");
  }
  else{pianoKeys[7] = minim.loadFile("C"+str(pitch)+".mp3");}
}

  
