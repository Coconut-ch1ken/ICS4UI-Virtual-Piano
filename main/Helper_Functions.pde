/*
changed noteNames to noteNames
added comments
changed pianoKeys to allAudioFilesOfTheNotes
changed allAudioFilesOfTheNotes to a 2D array
changed pianoSong into an arraylist containing note instances

*/

void drawKeys(){
  fill(0);
  textSize(32);
  textAlign(CENTER, CENTER);
  text("Press A, S, D, F, G, H, J, K to play piano keys", width / 2, height / 2 - 40);
  textSize(18);
  text("Pitch: " + pitch, width / 2, height / 2 - 10);
  textSize(12);
  text("Pressed Keys: " + join(typedKeys, " "), width/2, height-20);
  textSize(32);
  for (int i = 0; i < noteNames.length; i++) {
    fill(200);
    rect(50 + i * 50, height / 2 + 40, 40, 100);
    fill(0);
    text(noteNames[i], 50 + i * 50 + 20, height / 2 + 90);
  }
}


void initializeAllNotes(){
  for (int pitch = 0; pitch < pitches.length; pitch++) {
    for (int note = 0; note < noteNames.length; note++) {
      allNotes[pitch][note] = noteNames[note] + pitches[pitch];
    }
  }
}

void loadNotes(){
  for (int i = 0; i < pitches.length; i++) {
    for (int l = 0; l < noteNames.length; l++) {
      println("Loading file: " + noteNames[l] + pitches[i] + ".mp3");

      allAudioFilesOfTheNotes[i][l] = minim.loadFile(noteNames[l]+ pitches[i] + ".mp3");
    }
  }  
}
