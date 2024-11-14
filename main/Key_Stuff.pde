void keyPressed() {
  for (int i = 0; i < keyCodes.length; i++) {
    if (key == keyCodes[i] && !keyStates[i]) {
      indexOfNoteBeingPlayed = i;
      
      // Add the corresponding Note object to `pianoSong`
      Note noteToPlay = noteObjects[i][pitch];
      pianoSong.add(noteToPlay);
      keyStates[i] = true;

      // Play the note
      noteToPlay.play();
    }
  }
  
  if (key == pitchdown) {
    pitch--;
    if (pitch < 1){ pitch = 1; }
  } 
  else if (key == pitchup) {
    pitch++;
    if (pitch > 7){ pitch = 7; }
  }
  
  if (key == playkey) { 
    playSong();
  }
  
  if (key == resetkey) {
    resetSong();
  }
}


void keyReleased() {
  for (int i = 0; i < pitches.length; i++) {
    for (int l = 0; l < keyCodes.length; l++) {
      if (key == keyCodes[l] && keyStates[l]) {
        allAudioFilesOfTheNotes[i][l].pause();
        keyStates[i] = false;
      }
    }
  }
}

//void stop() {
//  // Close Minim when the sketch ends
//  for (int i = 0; i < pianoKeys.length; i++) {
//    pianoKeys[i].close();
//  }
//  for (int i = 0; i < pianoSong.length; i++){
//    pianoSong[i].close();
//  }
//  minim.stop();
//  super.stop();
//}

// Still working on these
void playSong() {
  //for (int i = songstopped; i < typedKeys.length; i++){
  //  playing = true;
  //  pianoSong[i].unmute();
  //  pianoSong[i].play();
  //  delay(1000);
  //songstopped = 0;
  //}
}

void resetSong() {
  if (key == resetkey){//Working on
    songstopped = 0;
    typedKeys = new String[0];
    println("reset");
  }
}
