// Initialize function to set up the audio system and UI components
void initialize() {
  
  // Set up minim variables for audio handling
  minim = new Minim(this); // Create a new Minim object for audio management
  out = minim.getLineOut(Minim.STEREO, 4096, 44100); // Set up audio output with stereo channels, buffer size of 4096, and a sample rate of 44100 Hz
  metronome = minim.loadFile("metronome.mp3"); // Load the metronome sound file into an AudioPlayer object
  
  // Create the graphical user interface (GUI)
  createGUI();
  
  // Load audio files for the notes into memory
  loadAudioFiles();
  
  // Create note objects based on the loaded audio files
  createNoteObjects();

  // Initialize key widths based on screen size
  whiteKeyWidth = width / 8.0; // The width of white keys is based on the screen width, with 8 white keys in total
  blackKeyWidth = whiteKeyWidth * 0.4; // Black keys are 40% of the width of white keys
  
  // Initialize the key display
  initializeKeys();

  // Display the screen with the updated UI
  displayScreen();
}

// Global ArrayList to store file names that are scheduled for deletion
ArrayList<String> filesToDelete = new ArrayList<>();

// Stop function to ensure the program shuts down properly and deletes files
void stop() { 
  minim.stop(); // Stop the Minim audio system to release resources
  super.stop(); // Call the parent class's stop function (ensure proper shutdown)

  // Loop through the filesToDelete ArrayList and attempt to delete each file
  for (String fileName : filesToDelete) {
    File file = new File(fileName); // Create a File object for the given file name
    if (file.exists()) { // Check if the file exists
      boolean success = file.delete(); // Try to delete the file
      if (success) {
        println("Successfully deleted file: " + fileName); // Print a success message if file was deleted
      } else {
        println("Failed to delete file: " + fileName); // Print a failure message if file deletion failed
      }
    } else {
      println("File not found: " + fileName); // Print a message if the file does not exist
    }
  }

  // Clear the filesToDelete list after attempting to delete all files
  filesToDelete.clear();
}

// Function to remove a specific song from the array of songs
String[] removeSong(String[] array, String songToRemove){
  int count = 0; // Counter to track the number of songs that are not being removed

  // Loop through the array to count the songs that are not the one to remove
  for(String song : array){
    if(!song.equals(songToRemove)){ // If the song is not the one to remove
      count++; // Increment the counter
    }
  }
  
  // Create a new array with the same size minus the removed song
  String[] newArray = new String[count];
  int index = 0; // Index for the new array

  // Loop through the original array again, adding all songs except the one to remove to the new array
  for(String song : array){
    if(!song.equals(songToRemove)){
      newArray[index++] = song; // Add the song to the new array
    }
  }
  
  return newArray; // Return the new array without the removed song
}
