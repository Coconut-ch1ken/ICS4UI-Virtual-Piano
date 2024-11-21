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

class Note {
  String note;
  int pitch;
  FilePlayer player;
  
  Note(String n, int p, FilePlayer fp) {
    this.note = n;
    this.pitch = p;
    this.player = fp;
  }
  
  void play() {
    this.player.rewind();
    //this.player.setGain(volume);
    this.player.play();
  }
}