void keyPressed() {
  for (int i = 0; i < keyCodes.length; i++) {     // Detect which key is pressed
    if (key == keyCodes[i] && !keyStates[i]) {    // If the key is in the keyCode list and the key is not being pressed down already
      Note noteToPlay = noteObjects[i][pitch-1];  // Project the key to the note that is about to be played
      keyStates[i] = true;  // Mark the key as pressed
      noteToPlay.play();    // Play the note
    }
  }
  // Some other keyboard operations that can be done
  if (key == pitchdown) { pitch = max(1, pitch-1); }
  else if (key == pitchup) { pitch = min(7, pitch+1); }

  if (key == playkey) { playSong(); }
  if (key == resetkey) { resetSong(); }
}


void keyReleased() {
  for (int i = 0; i < keyCodes.length; i++) {
    for (int l = 0; l < pitches.length; l++) {
      if (key == keyCodes[i] && keyStates[i]) {
        allAudioFilesOfTheNotes[i][l].pause();
        keyStates[i] = false;
      }
    }
  }
}



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
  if (key == resetkey) {//Working on
    songstopped = 0;
    typedKeys = new String[0];
    println("reset");
  }
}
