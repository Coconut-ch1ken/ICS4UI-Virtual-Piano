// The initial window that is about to be displayed
String windowName = "start";

//Background
PImage background;
PImage logo;
Boolean logoVisible = true;
boolean savedNotificationVisible = false;
int t = 0;  // a variable to assist the display of the notification of "song saved as xxx.wav"

void displayScreen() {
  //Background
  background = loadImage("bg.jpg");
  logo = loadImage("TuneTap_logo.png");
  songNames = loadStrings("savedSongs.txt");
  background(255);
  image(background, 0, 0); 
  if (logoVisible) image(logo, 300, 10);
  
  // This if statement determines if the notification of "song saved as xxx.wav" will display or not
  if (savedNotificationVisible){
    fill(200);
    textSize(30);
    text("Saved as "+ recordingName + ".wav", width/2, 380);
    t ++;  // increase the varable t by 1
    
    // if t has been increased by 120, namely 2 seconds (since the draw() defaults at 60 frames per second)
    if ( t > 121 ){
      t = 0;
      savedNotificationVisible = false;  // hide the notification
    }
  }
  
  if (windowName.equals("start")){
  // Display/hide the relevant buttons
    oneSecondBack.setVisible(false);
    oneSecondForward.setVisible(false);
    pausePlayingSongButton.setVisible(false);
    startPlayingSongButton.setVisible(false);
    songName.setVisible(false);
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
    songName.setVisible(true);
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
    logoVisible = false;
  }
  
  
  // If the user wants to select a song and play
  else if (windowName.equals("playSong")) {
    // Display/hide the relevant buttons
    oneSecondBack.setVisible(true);
    oneSecondForward.setVisible(true);
    pausePlayingSongButton.setVisible(true);
    startPlayingSongButton.setVisible(true);
    songName.setVisible(false);
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
