import ddf.minim.*;
import ddf.minim.ugens.*;
import g4p_controls.*;

// Global Variables
Minim minim;
AudioOutput out;
AudioRecorder recorder;
FilePlayer[][] allAudioFilesOfTheNotes;
FilePlayer[][] allAudioFilesOfTheNotesTwo;

// Piano Key and Note System
String[] noteNames = {"C", "D", "E", "F", "G", "A", "B", "C"};
String[] noteNames2 = {"Db", "Eb", "Gb", "Ab", "Bb"};
int[] pitches = {1, 2, 3, 4, 5, 6, 7};
int pitch = 4;

Key[] keys = new Key[noteNames.length];
Key[] keys2 = new Key[noteNames2.length];
Note[][] noteObjects = new Note[noteNames.length][pitches.length];
Note[][] noteObjects2 = new Note[noteNames2.length][pitches.length];

boolean[] keyStates = new boolean[8];
boolean[] keyStates2 = new boolean[5];

char[] keyCodes = {'a', 's', 'd', 'f', 'g', 'h', 'j', 'k'};
char[] keyCodes2 = {'w', 'e', 't', 'y', 'u'};
char pitchdown = '-';
char pitchup = '=';

void setup() {
  size(600, 600);
  minim = new Minim(this);

  // Set up audio output and recorder
  out = minim.getLineOut(Minim.STEREO, 2048, 44100);
  recorder = minim.createRecorder(out, "piano_recording.wav");

  // Initialize the piano system
  initialize();
  println("please work2");
}
//adding a line?
void draw() {
  recorder.beginRecord();
  background(255);
  drawKeys();

}
