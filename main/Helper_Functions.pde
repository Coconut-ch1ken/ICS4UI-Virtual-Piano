void loadAudioFileOfNotes(){
  for (int i = 0; i < noteNames.length; i++) {
    for (int l = 0; l < pitches.length; l++) {
      // if we are loading the C from the next octave
      if ( i == 7 ){
        println("Loading file: " + noteNames[i] + int(pitches[l]+1) + ".mp3");
        allAudioFilesOfTheNotes[i][l] = minim.loadFile(noteNames[i]+ int(pitches[l]+1) + ".mp3");
      }
      
      else{
        println("Loading file: " + noteNames[i] + pitches[l] + ".mp3");
        allAudioFilesOfTheNotes[i][l] = minim.loadFile(noteNames[i]+ pitches[l] + ".mp3");
      }
    }
  }
  for (int i = 0; i < noteNames2.length; i++) {
    for (int l = 0; l < pitches.length; l++) {
      println("Loading file: " + noteNames2[i] + pitches[l] + ".mp3");
      allAudioFilesOfTheNotesTwo[i][l] = minim.loadFile(noteNames2[i]+ pitches[l] + ".mp3");
    }
  }
}

// Creates Note objects and assigns them audio files
void createNoteObjects() {
  for (int i = 0; i < noteNames.length; i++) {
    for (int j = 0; j < pitches.length; j++) {
      // note that the notes objects are created and stored in the order [note][pitch]
      // In other words, noteObjects are in the form: C5
      noteObjects[i][j] = new Note(noteNames[i], j, allAudioFilesOfTheNotes[i][j]);
    }
  }
  for (int i = 0; i < noteNames2.length; i++) {
    for (int j = 0; j < pitches.length; j++) {
      noteObjects2[i][j] = new Note(noteNames2[i], j, allAudioFilesOfTheNotesTwo[i][j]);
    }
  }
}

void initialize(){
 // Initialize notes and audio files
  loadAudioFileOfNotes();
  // Create Note objects
  createNoteObjects();
  // Initialize the keys list by filling it in with key instances
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
