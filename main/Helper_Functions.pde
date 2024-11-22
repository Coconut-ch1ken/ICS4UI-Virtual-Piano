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

void deleteLineFromFile(String filePath, String lineToDelete) {
  try {
    // Read all lines into a list
    String[] lines = loadStrings(filePath);
    PrintWriter writer = new PrintWriter(filePath); // Overwrite the file

    // Write back lines that are not the one to delete
    for (String line : lines) {
      if (!line.equals(lineToDelete)) {
        writer.println(line);
      }
    }
    writer.close();
    println("Line deleted successfully!");
  } 
  
  catch (Exception e) {
    println("Error: " + e.getMessage());
  }
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
