void keyPressed() {
  for (int i = 0; i < keyCodes.length; i++) {     // Detect which key is pressed
    if (key == keyCodes[i] && !keyStates[i]) {    // If the key is in the keyCode list and the key is not being pressed down already
      Note noteToPlay = noteObjects[i][pitch-1];  // Project the key to the note that is about to be played
      keyStates[i] = true;  // Mark the key as pressed
      noteToPlay.play();    // Play the note
      keys[i].colour = color(211);
     
      if ( i == 7 ){ notes = append(notes, noteNames[i] + (pitch + 1)); }
      else {notes = append(notes, noteNames[i] + pitch); }
      
      if (notes.length > 20){
        reverseNotes = new ArrayList<String>(Arrays.asList(notes));
        Collections.reverse(reverseNotes);
        notes = shorten(reverseNotes.toArray(new String[0]));
        reverseNotes = new ArrayList<String>(Arrays.asList(notes));
        Collections.reverse(reverseNotes);
        notes = reverseNotes.toArray(new String[0]);
        //println("Normal: ", join(notes, " "));
        //println("Revere: ", join(reverseNotes.toArray(new String[0]), " "));
      }
    }
  }
  for (int i = 0; i < keyCodes2.length; i++) {     // Detect which key is pressed
    if (key == keyCodes2[i] && !keyStates2[i]) {    // If the key is in the keyCode list and the key is not being pressed down already
      Note noteToPlay2 = noteObjects2[i][pitch-1];  // Project the key to the note that is about to be played
      keyStates2[i] = true;  // Mark the key as pressed
      noteToPlay2.play();    // Play the note
      keys2[i].colour = color(211);
      notes = append(notes, noteNames2[i] + pitch);
      if (notes.length > 20){
        reverseNotes = new ArrayList<String>(Arrays.asList(notes));
        Collections.reverse(reverseNotes);
        notes = shorten(reverseNotes.toArray(new String[0]));
        reverseNotes = new ArrayList<String>(Arrays.asList(notes));
        Collections.reverse(reverseNotes);
        notes = reverseNotes.toArray(new String[0]);
        //println("Normal: ", join(notes, " "));
        //println("Revere: ", join(reverseNotes.toArray(new String[0]), " "));
      }
    }
  }
  // Some other keyboard operations that can be done
  if (key == pitchdown) { pitch = max(1, pitch-1); }
  else if (key == pitchup) { pitch = min(7, pitch+1); }
  if (key == recordKey) { stopRecording(); }
}

void keyReleased() {
  for (int i = 0; i < keyCodes.length; i++) {
    for (int l = 0; l < pitches.length; l++) {
      if (key == keyCodes[i] && keyStates[i]) {
        allAudioFilesOfTheNotes[i][l].pause();
        keys[i].colour = color(255);
        keyStates[i] = false;
      }
    }
  }
  for (int i = 0; i < keyCodes2.length; i++) {
    for (int l = 0; l < pitches.length; l++) {
      if (key == keyCodes2[i] && keyStates2[i]) {
        allAudioFilesOfTheNotesTwo[i][l].pause();
        keys2[i].colour = color(0);
        keyStates2[i] = false;
      }
    }
  }
}
