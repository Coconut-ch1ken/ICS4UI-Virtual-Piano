import ddf.minim.*;
import ddf.minim.ugens.*;
import g4p_controls.*;

Minim minim = new Minim(this);
AudioOutput out;
AudioRecorder recorder;

// Miscellaneous Variables
int pitch = 4;
int songstopped = 0;

// Constants that helps the program to load the mp3 files
String[] noteNames = {"C","D","E","F","G","A","B","C"};
int[] pitches = {1, 2, 3, 4, 5, 6, 7};

// A 2D array containing note objects
Note[][] noteObjects = new Note[noteNames.length][pitches.length];

// 2D arrays containing all mp3 files of the notes. This array have a bijection relationship with noteObjects 2D array
AudioPlayer[][] allAudioFilesOfTheNotes = new AudioPlayer[noteNames.length][pitches.length];

// An array containing key objects
Key[] keys = new Key[noteNames.length];

// Key settings
char[] keyCodes = {'a', 's', 'd', 'f', 'g', 'h', 'j','k'};
char pitchdown = '-';
char pitchup = '=';
char playkey = ' ';
char resetkey = 'r';

String[] typedKeys = {};

// Variables to help detect if a sound should be played
boolean playing = false;
boolean[] keyStates = new boolean[8];


void setup(){
  size(600,600);
  background(255);
  initialize();
  out = minim.getLineOut( Minim.STEREO, 2048, 44100 );
  
  recorder = minim.createRecorder( out, "output.wav" );
  
  recorder.beginRecord();
}

void draw() {
  background(255);
  drawKeys();
  //delay(100);
  //for (int i = 0; i < keys.length; i++) { // Detect which key is pressed
  //  keys[i].colour = color(255);
  //}
}
