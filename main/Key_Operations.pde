// keyPressed function: Detects when a key is pressed and plays the corresponding note
void keyPressed() {
  // Check if the keys are allowed to be played (canPlay is true)
  if (canPlay == true) {
    // Loop through the first set of key codes to detect if any key is pressed
    for (int i = 0; i < keyCodes.length; i++) {
      // If the key matches one in the keyCodes list and it's not already pressed
      if (key == keyCodes[i] && !keyStates[i]) {
        // Get the corresponding note object based on the key press and the current pitch
        Note noteToPlay = noteObjects[i][pitch - 1];
        keyStates[i] = true;  // Mark the key as pressed
        noteToPlay.play();    // Play the corresponding note
        keys[i].colour = color(211); // Change the key color to indicate it is pressed

        // Append the note name and pitch to the notes array
        if (i == 7) { 
          notes = append(notes, noteNames[i] + (pitch + 1));
        } else {
          notes = append(notes, noteNames[i] + pitch);
        }

        // If the notes array has more than 20 notes, reverse and shorten it
        if (notes.length > 20) {
          reverseNotes = new ArrayList<String>(Arrays.asList(notes)); // Convert the notes array to an ArrayList
          Collections.reverse(reverseNotes); // Reverse the order of notes
          notes = shorten(reverseNotes.toArray(new String[0])); // Shorten the list back to 20 notes
          reverseNotes = new ArrayList<String>(Arrays.asList(notes)); // Re-convert to ArrayList
          Collections.reverse(reverseNotes); // Reverse it again to restore the original order
          notes = reverseNotes.toArray(new String[0]); // Convert back to array
        }
      }
    }

    // Loop through the second set of key codes (keys2) to detect if any key is pressed
    for (int i = 0; i < keyCodes2.length; i++) {
      // If the key matches one in the keyCodes2 list and it's not already pressed
      if (key == keyCodes2[i] && !keyStates2[i]) {
        // Get the corresponding note object from the second note array
        Note noteToPlay2 = noteObjects2[i][pitch - 1];
        keyStates2[i] = true;  // Mark the key as pressed
        noteToPlay2.play();    // Play the corresponding note
        keys2[i].colour = color(211); // Change the key color to indicate it is pressed

        // Append the note name and pitch to the notes array
        notes = append(notes, noteNames2[i] + pitch);

        // If the notes array has more than 20 notes, reverse and shorten it
        if (notes.length > 20) {
          reverseNotes = new ArrayList<String>(Arrays.asList(notes)); // Convert the notes array to an ArrayList
          Collections.reverse(reverseNotes); // Reverse the order of notes
          notes = shorten(reverseNotes.toArray(new String[0])); // Shorten the list back to 20 notes
          reverseNotes = new ArrayList<String>(Arrays.asList(notes)); // Re-convert to ArrayList
          Collections.reverse(reverseNotes); // Reverse it again to restore the original order
          notes = reverseNotes.toArray(new String[0]); // Convert back to array
        }
      }
    }
  }

  // Additional keyboard operations: Change the pitch if certain keys are pressed
  if (key == pitchdown) { 
    pitch = max(1, pitch - 1); // Decrease pitch but ensure it doesn’t go below 1
  }
  else if (key == pitchup) { 
    pitch = min(7, pitch + 1); // Increase pitch but ensure it doesn’t exceed 7
  }
  else if (key == '\n') { 
    canPlay = true; // Enable key playing when 'Enter' is pressed
  }
}

// keyReleased function: Detects when a key is released and pauses the corresponding note
void keyReleased() {
  // Check if the keys are allowed to be played (canPlay is true)
  if (canPlay == true) {
    // Loop through the first set of key codes to detect which key was released
    for (int i = 0; i < keyCodes.length; i++) {
      // Loop through each pitch to find the corresponding note for the released key
      for (int l = 0; l < pitches.length; l++) {
        if (key == keyCodes[i] && keyStates[i]) {
          // Pause the note that was playing and reset the key state
          allAudioFilesOfTheNotes[i][l].pause();
          keys[i].colour = color(255); // Reset the key color
          keyStates[i] = false; // Mark the key as not pressed
        }
      }
    }

    // Loop through the second set of key codes (keys2) to detect which key was released
    for (int i = 0; i < keyCodes2.length; i++) {
      // Loop through each pitch to find the corresponding note for the released key
      for (int l = 0; l < pitches.length; l++) {
        if (key == keyCodes2[i] && keyStates2[i]) {
          // Pause the note that was playing and reset the key state
          allAudioFilesOfTheNotesTwo[i][l].pause();
          keys2[i].colour = color(0); // Reset the key color
          keyStates2[i] = false; // Mark the key as not pressed
        }
      }
    }
  }
}
