// Import Minim library for audio handling
Minim minim; // The main Minim object to manage audio operations
AudioOutput out; // Audio output object to play sounds
AudioRecorder recorder; // Audio recorder object for recording audio
AudioPlayer metronome; // Audio player object for playing metronome sound
FilePlayer[][] allAudioFilesOfTheNotes; // 2D array to hold FilePlayer objects for the first set of notes
FilePlayer[][] allAudioFilesOfTheNotesTwo; // 2D array to hold FilePlayer objects for the second set of notes

// Default settings for recording
String recordingName = "piano_recording"; // Default name for the recording file
int recorderCount = 0; // A variable that make sure the initializeRecorder() does not run multiple times
String[] songNames; // Array to hold the names of saved songs
boolean startRecording = false; // Boolean variable indicate whether recording has started

// Function to load audio files into FilePlayer objects
void loadAudioFiles() {
  // Initialize 2D arrays for notes
  allAudioFilesOfTheNotes = new FilePlayer[noteNames.length][pitches.length];
  allAudioFilesOfTheNotesTwo = new FilePlayer[noteNames2.length][pitches.length];
  
  String fileName; // Temporary variable to store the file name
  
  // Loop through the first set of notes and pitches to load audio files
  for (int i = 0; i < noteNames.length; i++) {
    for (int j = 0; j < pitches.length; j++) {
      // Adjust file name for specific condition (e.g., increment pitch for note index 7)
      if (i == 7) {
        fileName = noteNames[i] + int(pitches[j] + 1) + ".mp3";
      } else {
        fileName = noteNames[i] + pitches[j] + ".mp3";
      }

      // Load the audio file into a FilePlayer and patch it to the audio output
      allAudioFilesOfTheNotes[i][j] = new FilePlayer(minim.loadFileStream(fileName));
      allAudioFilesOfTheNotes[i][j].patch(out);
    }
  }

  // Loop through the second set of notes and pitches to load audio files
  for (int i = 0; i < noteNames2.length; i++) {
    for (int j = 0; j < pitches.length; j++) {
      // Generate file name for the second set of notes
      fileName = noteNames2[i] + pitches[j] + ".mp3";
      
      // Load the audio file into a FilePlayer and patch it to the audio output
      allAudioFilesOfTheNotesTwo[i][j] = new FilePlayer(minim.loadFileStream(fileName));
      allAudioFilesOfTheNotesTwo[i][j].patch(out);
    }
  }
}

// Function to initialize the audio recorder
void initializeRecorder() {
  // Create a new audio recorder using the audio output and set the file name
  recorder = minim.createRecorder(out, recordingName + ".wav");
  
  // Begin recording audio
  recorder.beginRecord();
}

// Function to stop the audio recording
void stopRecording() {
  // Stop recording and finalize the audio file
  recorder.endRecord();
  
  // Save the recorded audio to a file
  recorder.save();
}
