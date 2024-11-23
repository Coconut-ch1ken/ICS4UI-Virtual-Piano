void initialize() {
  
  
  // Set up minim variables
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO, 4096, 44100);
  metronome = minim.loadFile("metronome.mp3");
  
  createGUI();
  loadAudioFiles();
  createNoteObjects();

  // Initialize key widths based on screen size
  whiteKeyWidth = width / 8.0; // Total 8 white keys
  blackKeyWidth = whiteKeyWidth * 0.4; // Black keys are 40% of white keys
  initializeKeys();

  displayScreen();
}

// Global ArrayList to store file names to delete
ArrayList<String> filesToDelete = new ArrayList<>();

void stop() { //function to ensure program closes properly
  minim.stop();
  super.stop();

  for (String fileName : filesToDelete) {
    File file = new File(fileName);
    if (file.exists()) {
      boolean success = file.delete();
      if (success) {
        println("Successfully deleted file: " + fileName);
      } else {
        println("Failed to delete file: " + fileName);
      }
    } else {
      println("File not found: " + fileName);
    }
  }
  // Clear the list after attempting deletion
  filesToDelete.clear();

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
