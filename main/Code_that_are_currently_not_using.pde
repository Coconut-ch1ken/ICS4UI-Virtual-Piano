/*
String[][] allNotes = new String[7][8];

void initializeAllNotes(){
  for (int pitch = 0; pitch < pitches.length; pitch++) {
    for (int note = 0; note < noteNames.length; note++) {
      allNotes[pitch][note] = noteNames[note] + pitches[pitch];
    }
  }
}

// Dynamic list to store Notes played (in the form of note instances)
ArrayList<Note> pianoSong = new ArrayList<Note>(); 

void stop() {
  // Close Minim when the sketch ends
  for (int i = 0; i < pianoKeys.length; i++) {
    pianoKeys[i].close();
  }
  for (int i = 0; i < pianoSong.length; i++){
    pianoSong[i].close();
  }
  minim.stop();
  super.stop();
}

These are previously in the draw function:
  //pianoSong = new AudioPlayer[typedKeys.length];
  //for (int i = 0; i < pianoSong.length; i++){
  //  pianoSong[i] = minim.loadFile(typedKeys[i] + ".mp3");
  //} 

These are in keyPressed()
  // Add the corresponding Note object to `pianoSong`
  //pianoSong.add(noteToPlay);

*/
