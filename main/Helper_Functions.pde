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


String[] removeSong(String[] array, String songToRemove){
  
 int count = 0;
 for(String song : array){
   if(!song.equals(songToRemove)){
    count++; 
   }
 }
  String[] newArray = new String[count];
  int index = 0;
  
  for(String song : array){
   if(!song.equals(songToRemove)){
     newArray[index++] = song;
   }
  }
  
  return newArray;
}
