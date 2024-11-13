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
  
  
  
  
}
