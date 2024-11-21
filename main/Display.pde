void displayScreen() {
  
  // Display initial screen
  if (windowName.equals("main")) {
    
    // Display/hide the relevant buttons
    oneSecondBack.setVisible(false);
    oneSecondForward.setVisible(false);
    pausePlayingSongButton.setVisible(false);
    endPlayingSongButton.setVisible(false);
    Song_Name.setVisible(false);
    metro.setVisible(true);
    metroSpeed.setVisible(true);
    recordButton.setVisible(true);
    stopRecord.setVisible(true);
    Saved_Songs.setVisible(true);
  }
  
  
  // When the user wants to save song
  else if (windowName.equals("nameSong")) {
    
    // Display/hide the relevant buttons
    oneSecondBack.setVisible(false);
    oneSecondForward.setVisible(false);
    pausePlayingSongButton.setVisible(false);
    endPlayingSongButton.setVisible(false);
    Song_Name.setVisible(true);
    metro.setVisible(false);
    metroSpeed.setVisible(false);
    recordButton.setVisible(false);
    stopRecord.setVisible(false);
    Saved_Songs.setVisible(false);
  }
  
  // If the user wants to select a song and play
  else if (windowName.equals("playSong")) {
    // Display/hide the relevant buttons
    oneSecondBack.setVisible(true);
    oneSecondForward.setVisible(true);
    pausePlayingSongButton.setVisible(true);
    endPlayingSongButton.setVisible(true);
    Song_Name.setVisible(false);
    metro.setVisible(false);
    metroSpeed.setVisible(false);
    recordButton.setVisible(false);
    stopRecord.setVisible(false);
    Saved_Songs.setVisible(false);
  }
}
