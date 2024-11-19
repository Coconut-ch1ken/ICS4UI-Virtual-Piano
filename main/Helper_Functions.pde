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

void initializeKeys(){
   for ( int i = 0; i < keys.length; i++ ) {
    keys[i] = new Key( i * 75, 450, 75, 150, noteNames[i], color(255), color(0) );
  }
  for ( int i = 0; i < keys2.length; i++ ) {
    if(i < 2){
      keys2[i] = new Key( 60 + i * 75, 450, 30, 75, noteNames2[i], color(0), color(255) );

    } else if(i >= 2){
      keys2[i] = new Key(  60 + (i+1) * 75, 450, 30, 75, noteNames2[i], color(0), color(255) );
    }
  }
}

void stopRecording(){
    fill(0); 
    textSize(20); 
    text("Saved as a piano_recording.wav", width/2, height/2); 
    recorder.endRecord(); 
    recorder.save();
    
    minim.stop();
    super.stop();
}

//void playFourTickMetronome(){
//  metronomeFourTick.rewind();
//  metronomeFourTick.setPlaybackRate(4);
//  metronomeFourTick.play();
//}
