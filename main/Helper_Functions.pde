void initialize() {

  createGUI();
  loadAudioFiles();
  createNoteObjects();

  // Initialize key widths based on screen size
  whiteKeyWidth = width / 8.0; // Total 8 white keys
  blackKeyWidth = whiteKeyWidth * 0.4; // Black keys are 40% of white keys

  initializeKeys();

  displayScreen();
}

void stop() { //function to ensure program closes properly
  minim.stop();
  super.stop();
}
