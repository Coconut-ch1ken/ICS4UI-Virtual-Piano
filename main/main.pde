import ddf.minim.*;
import g4p_controls.*;

Minim minim;
int pitch;
int songstopped = 0;

// some does not have a 0
String[][] allNotes = new String[7][8];
AudioPlayer[][] allAudioFilesOfTheNotes = new AudioPlayer[7][8];
ArrayList<Note> pianoSong = new ArrayList<Note>(); // Dynamic list to store Notes played (in the form of note instances)
String[] noteNames = {"C","D","E","F","G","A","B","C"};
int[] pitches = {1, 2, 3, 4, 5, 6, 7};

char[] keyCodes = {'a', 's', 'd', 'f', 'g', 'h', 'j','k'};
char pitchdown = '-';
char pitchup = '=';
char playkey = ' ';
char resetkey = 'r';

String[] typedKeys = {};
int indexOfNoteBeingPlayed;

boolean playing = false;
boolean[] keyStates = new boolean[8];

// Array to hold Note objects
Note[][] noteObjects;

void setup(){
  size(600,600);
  minim = new Minim(this);
  pitch = 4;

  // Initialize notes and audio files
  initializeAllNotes();
  loadNotes();

  // Create Note objects
  createNoteObjects();

  background(255);
}

void draw() {
  background(255);
  drawKeys();
  
  //pianoSong = new AudioPlayer[typedKeys.length];
  //for (int i = 0; i < pianoSong.length; i++){
  //  pianoSong[i] = minim.loadFile(typedKeys[i] + ".mp3");
  //} 
}

// Creates Note objects and assigns them audio files
void createNoteObjects() {
  noteObjects = new Note[noteNames.length][pitches.length];
  for (int i = 0; i < noteNames.length; i++) {
    for (int j = 0; j < pitches.length; j++) {
      // note that the notes objects are created in the order [note][pitch], not in the [pitch][note] order of how they are stored
      noteObjects[i][j] = new Note(noteNames[i], j, allAudioFilesOfTheNotes[j][i]);
    }
  }
}
