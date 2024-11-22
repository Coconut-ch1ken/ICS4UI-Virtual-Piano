//imports
import ddf.minim.*;
import ddf.minim.ugens.*;
import g4p_controls.*;
import java.util.*;
import java.io.*;

//Background
PImage background;

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

void setup() {
  size(800, 600);
  minim = new Minim(this);
  // Set up audio output
  out = minim.getLineOut(Minim.STEREO, 4096, 44100);
  metronome = minim.loadFile("metronome.mp3");
  initialize();  // Initialize the piano system
}

void draw() {
  displayScreen();
}
