// Minim initialization
Minim minim;
AudioOutput out;
AudioRecorder recorder;
AudioPlayer metronome;
FilePlayer[][] allAudioFilesOfTheNotes;
FilePlayer[][] allAudioFilesOfTheNotesTwo;

// Default settings for recording
String recordingName = "piano_recording";
int recorderCount = 0;
String[] songNames;
boolean startRecording = false;

// Load audio files into FilePlayer objects
void loadAudioFiles() {
  allAudioFilesOfTheNotes = new FilePlayer[noteNames.length][pitches.length];
  allAudioFilesOfTheNotesTwo = new FilePlayer[noteNames2.length][pitches.length];
  String fileName;
  for (int i = 0; i < noteNames.length; i++) {
    for (int j = 0; j < pitches.length; j++) {
      if ( i == 7 ) {
        fileName = noteNames[i] + int(pitches[j]+1) + ".mp3";
      } 
      else {
        fileName = noteNames[i] + pitches[j] + ".mp3";
      }

      allAudioFilesOfTheNotes[i][j] = new FilePlayer(minim.loadFileStream(fileName));
      allAudioFilesOfTheNotes[i][j].patch(out); // Patch to audio output
    }
  }

  for (int i = 0; i < noteNames2.length; i++) {
    for (int j = 0; j < pitches.length; j++) {
      fileName = noteNames2[i] + pitches[j] + ".mp3";
      allAudioFilesOfTheNotesTwo[i][j] = new FilePlayer(minim.loadFileStream(fileName));
      allAudioFilesOfTheNotesTwo[i][j].patch(out); // Patch to audio output
    }
  }
}

void initializeRecorder() {
  recorder = minim.createRecorder(out, recordingName + ".wav");
  recorder.beginRecord();
}

void stopRecording() {
  fill(0);
  textSize(100);
  text("Saved as "+ recordingName + ".wav", width/2, 200);
  recorder.endRecord();
  recorder.save();
}
