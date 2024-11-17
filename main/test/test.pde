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
  size(800, 400);
  minim = new Minim(this);

  // Set up audio output and recorder
  out = minim.getLineOut(Minim.STEREO, 2048, 44100);
  recorder = minim.createRecorder(out, "piano_recording.wav");

  // Initialize the piano system
  initialize();

  println("Press 'r' to start recording, 'p' to stop and save, and 't' to play a test note.");
}

void draw() {
  background(255);
  drawKeys();

  // Recording status
  fill(0);
  textSize(14);
  if (recorder.isRecording()) {
    text("Recording in progress...", 10, height - 20);
  } else {
    text("Recorder is idle.", 10, height - 20);
  }
}

void initialize() {
  loadAudioFiles();
  createNoteObjects();
  initializeKeys();
}

// Load audio files into FilePlayer objects
void loadAudioFiles() {
  allAudioFilesOfTheNotes = new FilePlayer[noteNames.length][pitches.length];
  allAudioFilesOfTheNotesTwo = new FilePlayer[noteNames2.length][pitches.length];

  for (int i = 0; i < noteNames.length; i++) {
    for (int j = 0; j < pitches.length; j++) {
      String fileName = noteNames[i] + pitches[j] + ".mp3";
      allAudioFilesOfTheNotes[i][j] = new FilePlayer(minim.loadFileStream(fileName));
      allAudioFilesOfTheNotes[i][j].patch(out); // Patch to audio output
    }
  }

  for (int i = 0; i < noteNames2.length; i++) {
    for (int j = 0; j < pitches.length; j++) {
      String fileName = noteNames2[i] + pitches[j] + ".mp3";
      allAudioFilesOfTheNotesTwo[i][j] = new FilePlayer(minim.loadFileStream(fileName));
      allAudioFilesOfTheNotesTwo[i][j].patch(out); // Patch to audio output
    }
  }
}

// Create Note objects with corresponding FilePlayer
void createNoteObjects() {
  for (int i = 0; i < noteNames.length; i++) {
    for (int j = 0; j < pitches.length; j++) {
      noteObjects[i][j] = new Note(noteNames[i], j, allAudioFilesOfTheNotes[i][j]);
    }
  }

  for (int i = 0; i < noteNames2.length; i++) {
    for (int j = 0; j < pitches.length; j++) {
      noteObjects2[i][j] = new Note(noteNames2[i], j, allAudioFilesOfTheNotesTwo[i][j]);
    }
  }
}

// Create Key objects
void initializeKeys() {
  for (int i = 0; i < keys.length; i++) {
    keys[i] = new Key(i * 75, 200, 75, 150, noteNames[i], color(255), color(0));
  }

  for (int i = 0; i < keys2.length; i++) {
    int xOffset = (i < 2) ? 60 + i * 75 : 60 + (i + 1) * 75;
    keys2[i] = new Key(xOffset, 200, 30, 75, noteNames2[i], color(0), color(255));
  }
}

void keyPressed() {
  // Handle white keys
  for (int i = 0; i < keyCodes.length; i++) {
    if (key == keyCodes[i] && !keyStates[i]) {
      noteObjects[i][pitch - 1].play();
      keyStates[i] = true;
      keys[i].colour = color(211);
    }
  }

  // Handle black keys
  for (int i = 0; i < keyCodes2.length; i++) {
    if (key == keyCodes2[i] && !keyStates2[i]) {
      noteObjects2[i][pitch - 1].play();
      keyStates2[i] = true;
      keys2[i].colour = color(211);
    }
  }

  // Adjust pitch
  if (key == pitchdown) pitch = max(1, pitch - 1);
  else if (key == pitchup) pitch = min(7, pitch + 1);

  // Recording controls
  if (key == 'r') {
    if (!recorder.isRecording()) {
      recorder.beginRecord();
      println("Recording started...");
    } else {
      println("Already recording!");
    }
  } else if (key == 'p') {
    if (recorder.isRecording()) {
      recorder.endRecord();
      recorder.save();
      println("Recording stopped and saved.");
    } else {
      println("Recorder is not recording.");
    }
  }
}

void keyReleased() {
  // Reset white keys
  for (int i = 0; i < keyCodes.length; i++) {
    if (key == keyCodes[i]) {
      keys[i].colour = color(255);
      keyStates[i] = false;
    }
  }

  // Reset black keys
  for (int i = 0; i < keyCodes2.length; i++) {
    if (key == keyCodes2[i]) {
      keys2[i].colour = color(0);
      keyStates2[i] = false;
    }
  }
}

class Key {
  PVector pos, size;
  String note;
  color colour, textColour;

  Key(float x, float y, float w, float h, String n, color c, color tc) {
    pos = new PVector(x, y);
    size = new PVector(w, h);
    note = n;
    colour = c;
    textColour = tc;
  }

  void display() {
    fill(colour);
    rect(pos.x, pos.y, size.x, size.y);
    fill(textColour);
    textAlign(CENTER, CENTER);
    text(note, pos.x + size.x / 2, pos.y + size.y / 2);
  }
}

class Note {
  String note;
  int pitch;
  FilePlayer player;

  Note(String n, int p, FilePlayer fp) {
    note = n;
    pitch = p;
    player = fp;
  }

  void play() {
    player.rewind();
    player.play();
  }
}

void drawKeys() {
  // Draw the white keys
  for (int i = 0; i < keys.length; i++) {
    keys[i].display();
  }

  // Draw the black keys
  for (int i = 0; i < keys2.length; i++) {
    keys2[i].display();
  }
}
