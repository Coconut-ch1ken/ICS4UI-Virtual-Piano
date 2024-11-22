// The initial window that is about to be displayed
String windowName = "start";

void displayScreen() {
  //Background
  background = loadImage("background.png");
  songNames = loadStrings("savedSongs.txt");
  background(255);
  image(background, 0, 0); 
  
  if (windowName.equals("start")){
  // Display/hide the relevant buttons
    oneSecondBack.setVisible(false);
    oneSecondForward.setVisible(false);
    pausePlayingSongButton.setVisible(false);
    startPlayingSongButton.setVisible(false);
    Song_Name.setVisible(false);
    metro.setVisible(false);
    metroSpeed.setVisible(false);
    recordButton.setVisible(false);
    stopRecord.setVisible(false);
    Saved_Songs.setVisible(false);
    playSongButton.setVisible(true);
    goBackButton.setVisible(false);
    playPianoButton.setVisible(true);
    pitchUpButton.setVisible(false);
    pitchDownButton.setVisible(false);
    deleteButton.setVisible(false);
  }
  
  // Display initial screen
  else if (windowName.equals("main")) {
    // Draw the keys and the text labels
    drawKeys();  
    
    // Recording functionality
    if ( startRecording == true ){ 
      if(recorderCount <= 1){
        initializeRecorder();
        recorderCount += 1;
      } 
    }
   
  
    // Metronome functionality
    if (metronomeOn) {
      long currentNanoTime = System.nanoTime(); // Get the current time in nanoseconds
      float deltaT = currentNanoTime - lastMetronomeTick;// Calculate the time difference in nanoseconds
      
      if (deltaT >= (60.0 / bpm) * 1000000000) {
        metronome.rewind();
        metronome.play();
        lastMetronomeTick = currentNanoTime;
      }
    }
    // Display/hide the relevant buttons
    oneSecondBack.setVisible(false);
    oneSecondForward.setVisible(false);
    pausePlayingSongButton.setVisible(false);
    startPlayingSongButton.setVisible(false);
    Song_Name.setVisible(true);
    metro.setVisible(true);
    metroSpeed.setVisible(true);
    recordButton.setVisible(true);
    stopRecord.setVisible(true);
    Saved_Songs.setVisible(false);
    playSongButton.setVisible(true);
    goBackButton.setVisible(false);
    playPianoButton.setVisible(false);
    pitchUpButton.setVisible(true);
    pitchDownButton.setVisible(true);
    deleteButton.setVisible(false);
  }
  
  
  // If the user wants to select a song and play
  else if (windowName.equals("playSong")) {
    // Display/hide the relevant buttons
    oneSecondBack.setVisible(true);
    oneSecondForward.setVisible(true);
    pausePlayingSongButton.setVisible(true);
    startPlayingSongButton.setVisible(true);
    Song_Name.setVisible(false);
    metro.setVisible(false);
    metroSpeed.setVisible(false);
    recordButton.setVisible(false);
    stopRecord.setVisible(false);
    Saved_Songs.setVisible(true);
    playSongButton.setVisible(false);
    goBackButton.setVisible(true);
    playPianoButton.setVisible(false);
    pitchUpButton.setVisible(false);
    pitchDownButton.setVisible(false);
    deleteButton.setVisible(true);
  }
}
