import ddf.minim.*;
import ddf.minim.ugens.*;
import g4p_controls.*;

Minim minim = new Minim(this);
AudioOutput out;
AudioPlayer output;
AudioRecorder recorder;


// Miscellaneous Variables
int pitch = 4;
int songstopped = 0;

// Constants that helps the program to load the mp3 files
String[] noteNames = {"C","D","E","F","G","A","B","C"};
String[] noteNames2 = {"Db", "Eb", "Gb", "Ab", "Bb"};
int[] pitches = {1, 2, 3, 4, 5, 6, 7};

// A 2D array containing note objects
Note[][] noteObjects = new Note[noteNames.length][pitches.length];
Note[][] noteObjects2 = new Note[noteNames2.length][pitches.length];

// 2D arrays containing all mp3 files of the notes. This array have a bijection relationship with noteObjects 2D array
AudioPlayer[][] allAudioFilesOfTheNotes = new AudioPlayer[noteNames.length][pitches.length];
AudioPlayer[][] allAudioFilesOfTheNotesTwo = new AudioPlayer[noteNames2.length][pitches.length];
// An array containing key objects
Key[] keys = new Key[noteNames.length];
Key[] keys2 = new Key[noteNames2.length];

// Key settings
char[] keyCodes = {'a', 's', 'd', 'f', 'g', 'h', 'j','k'};
char[] keyCodes2 = {'w', 'e', 't', 'y', 'u'};
char pitchdown = '-';
char pitchup = '=';
char playkey = ' ';
char resetkey = 'r';

//String[] typedKeys = {};

// Variables to help detect if a sound should be played
boolean playing = false;
boolean[] keyStates = new boolean[8];
boolean[] keyStates2 = new boolean[5];


void setup(){
  size(600,600);
  background(255);
  initialize();
  out = minim.getLineOut( Minim.STEREO, 2048, 44100 );
  output = minim.loadFile( "output1.wav" );
  recorder = minim.createRecorder( out, "output1.wav" );
  
  recorder.beginRecord();
}

void draw() {
  background(255);
  drawKeys();
}
