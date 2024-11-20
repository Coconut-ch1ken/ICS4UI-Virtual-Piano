//imports
import ddf.minim.*;
import ddf.minim.ugens.*;
import g4p_controls.*;
import java.util.*;

// Minim initialization
Minim minim;
AudioOutput out;
AudioRecorder recorder;
FilePlayer[][] allAudioFilesOfTheNotes;
FilePlayer[][] allAudioFilesOfTheNotesTwo;


AudioPlayer metronome;
AudioPlayer metronomeFourTick;

// Piano Key and Note System
String[] noteNames = {"C", "D", "E", "F", "G", "A", "B", "C"};
String[] noteNames2 = {"Db", "Eb", "Gb", "Ab", "Bb"};
int[] pitches = {1, 2, 3, 4, 5, 6, 7};

// Arrays used to store key objects
Key[] keys = new Key[noteNames.length];
Key[] keys2 = new Key[noteNames2.length];

String[] notes = {};
ArrayList<String> reverseNotes = new ArrayList<String>(Arrays.asList(notes));

// 2D arrays used to store note objects
Note[][] noteObjects = new Note[noteNames.length][pitches.length];
Note[][] noteObjects2 = new Note[noteNames2.length][pitches.length];

// Arrays containing booleans to detect is a key is pressed
boolean[] keyStates = new boolean[8];
boolean[] keyStates2 = new boolean[5];

// What keys on the keyboards are being mapped to the keys on the virtual piano
char[] keyCodes = {'a', 's', 'd', 'f', 'g', 'h', 'j', 'k'};
char[] keyCodes2 = {'w', 'e', 't', 'y', 'u'};

// Keys for controlling the virtual piano
char pitchdown = '-';
char pitchup = '=';
char recordKey = 'p';

String recordingName = "piano_recording";

// Metronome variables
boolean metronomeOn = false;
int bpm = 240 ; // beats per minute
int metronomeInterval;
long lastMetronomeTick = 0;

int recorderCount = 0;

void setup() {
  size(600, 300);
  minim = new Minim(this);

  // Set up audio output and recorder
  out = minim.getLineOut(Minim.STEREO, 4096, 44100);
  //recorder = minim.createRecorder(out, recordingName + ".wav");
  metronome = minim.loadFile("metronome.mp3");
  
  //metronomeFourTick = minim.loadFile("metronome-4-tick.mp3");

  // Initialize the piano system
  initialize();
  createGUI();
}

void draw() {
  if ( startRecording == true ){ 
  
  if(recorderCount <= 1){
  initializeRecorder();
  recorderCount += 1;
    }
  }
   
  
  background(255);

  drawKeys();  


  // Metronome functionality
  if (metronomeOn) {
    long currentNanoTime = System.nanoTime(); // Get the current time in nanoseconds
    
    // Calculate the time difference in nanoseconds
    if (currentNanoTime - lastMetronomeTick >= (60.0 / bpm) * 1000000000) {
      metronome.rewind();
      metronome.play();
      lastMetronomeTick = currentNanoTime;
    }
  }
//ADDING A COMMENT
}

void stop(){ //function to ensure program closes properly
     minim.stop();
    super.stop(); 
}

void initializeRecorder(){

    recorder = minim.createRecorder(out, recordingName + ".wav");
    recorder.beginRecord();
    
}
