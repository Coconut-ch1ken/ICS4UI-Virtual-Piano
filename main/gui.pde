/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

public void toggleMetronome(GButton source, GEvent event) { //_CODE_:metro:804595:
  metronomeOn = !metronomeOn;
} //_CODE_:metro:804595:

public void changeMetronomeSpeed(GSlider source, GEvent event) { //_CODE_:metroSpeed:800338:
  bpm = metroSpeed.getValueI();
} //_CODE_:metroSpeed:800338:

public void recordButton_click(GButton source, GEvent event) { //_CODE_:recordButton:983280:
  startRecording = true;
  //recorder.beginRecord();
} //_CODE_:recordButton:983280:

public void endRecordButton_click(GButton source, GEvent event) { //_CODE_:stopRecord:494914:
  stopRecording();
  songNames = append(songNames, recordingName);
  printArray(songNames);
  saveStrings("savedSongs.txt",songNames);
  Saved_Songs.setItems(loadStrings("savedSongs.txt"), 0);  // update the contents in the dropdown list
} //_CODE_:stopRecord:494914:

public void savedSongsList_click(GDropList source, GEvent event) { //_CODE_:Saved_Songs:365739:
  selectedSong = source.getSelectedText();
  temp = minim.loadFile(selectedSong + ".mp3");
  
} //_CODE_:Saved_Songs:365739:

public void changeSongName(GTextField source, GEvent event) { //_CODE_:Song_Name:826993:
  recordingName = source.getText();
} //_CODE_:Song_Name:826993:

public void backOneSecondButton_click(GButton source, GEvent event) { //_CODE_:oneSecondBack:359539:
  int newPosition = max(0, temp.position() - 1000);
  temp.cue(newPosition);
} //_CODE_:oneSecondBack:359539:

public void pausePlayingSongButton_click(GButton source, GEvent event) { //_CODE_:pausePlayingSongButton:600804:
  if (temp.isPlaying()) { temp.pause(); }  // If playing, pause it
  else { temp.play(); }  // If paused, resume playback
} //_CODE_:pausePlayingSongButton:600804:

public void forwardOneSecondButton_click(GButton source, GEvent event) { //_CODE_:oneSecondForward:727295:
  int newPosition = min(temp.length(), temp.position() + 1000);
  temp.cue(newPosition);
} //_CODE_:oneSecondForward:727295:

public void startPlayingSongButton_click(GButton source, GEvent event) { //_CODE_:startPlayingSongButton:229623:
  temp.rewind();
  temp.play();
} //_CODE_:startPlayingSongButton:229623:

public void pitchUpButton_click(GButton source, GEvent event) { //_CODE_:pitchUpButton:681935:
  pitch = min(7, pitch+1);
} //_CODE_:pitchUpButton:681935:

public void pitchDownButton_click(GButton source, GEvent event) { //_CODE_:pitchDownButton:602214:
  pitch = max(1, pitch-1);
} //_CODE_:pitchDownButton:602214:

public void playSongButton_click(GButton source, GEvent event) { //_CODE_:playSongButton:424127:
  windowName = "playSong";
} //_CODE_:playSongButton:424127:

public void goBackButton_click(GButton source, GEvent event) { //_CODE_:goBackButton:582580:
  windowName = "main";
} //_CODE_:goBackButton:582580:

public void playPianoButton_click(GButton source, GEvent event) { //_CODE_:playPianoButton:889308:
  windowName = "main";
} //_CODE_:playPianoButton:889308:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Sketch Window");
  metro = new GButton(this, 41, 92, 80, 30);
  metro.setText("Toggle Metronome");
  metro.addEventHandler(this, "toggleMetronome");
  metroSpeed = new GSlider(this, 463, 98, 287, 40, 10.0);
  metroSpeed.setLimits(60, 0, 240);
  metroSpeed.setNumberFormat(G4P.INTEGER, 0);
  metroSpeed.setOpaque(false);
  metroSpeed.addEventHandler(this, "changeMetronomeSpeed");
  recordButton = new GButton(this, 657, 185, 80, 30);
  recordButton.setText("Start Record");
  recordButton.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
  recordButton.addEventHandler(this, "recordButton_click");
  stopRecord = new GButton(this, 658, 227, 80, 30);
  stopRecord.setText("Stop Record");
  stopRecord.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
  stopRecord.addEventHandler(this, "endRecordButton_click");
  Saved_Songs = new GDropList(this, 259, 191, 278, 80, 3, 10);
  Saved_Songs.setItems(loadStrings("savedSongs.txt"), 0);
  Saved_Songs.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
  Saved_Songs.addEventHandler(this, "savedSongsList_click");
  Song_Name = new GTextField(this, 146, 298, 494, 52, G4P.SCROLLBARS_NONE);
  Song_Name.setText("Song name");
  Song_Name.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  Song_Name.setOpaque(true);
  Song_Name.addEventHandler(this, "changeSongName");
  oneSecondBack = new GButton(this, 86, 380, 80, 30);
  oneSecondBack.setText("<-- 1s");
  oneSecondBack.addEventHandler(this, "backOneSecondButton_click");
  pausePlayingSongButton = new GButton(this, 461, 376, 80, 30);
  pausePlayingSongButton.setText("Pause");
  pausePlayingSongButton.addEventHandler(this, "pausePlayingSongButton_click");
  oneSecondForward = new GButton(this, 632, 375, 80, 30);
  oneSecondForward.setText("--> 1s");
  oneSecondForward.addEventHandler(this, "forwardOneSecondButton_click");
  startPlayingSongButton = new GButton(this, 288, 375, 80, 30);
  startPlayingSongButton.setText("Start");
  startPlayingSongButton.addEventHandler(this, "startPlayingSongButton_click");
  pitchUpButton = new GButton(this, 41, 144, 80, 30);
  pitchUpButton.setText("Pitch Up");
  pitchUpButton.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  pitchUpButton.addEventHandler(this, "pitchUpButton_click");
  pitchDownButton = new GButton(this, 40, 184, 80, 30);
  pitchDownButton.setText("Pitch Down");
  pitchDownButton.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  pitchDownButton.addEventHandler(this, "pitchDownButton_click");
  playSongButton = new GButton(this, 356, 254, 80, 30);
  playSongButton.setText("Play Song");
  playSongButton.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  playSongButton.addEventHandler(this, "playSongButton_click");
  goBackButton = new GButton(this, 355, 260, 80, 30);
  goBackButton.setText("Go Back");
  goBackButton.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  goBackButton.addEventHandler(this, "goBackButton_click");
  playPianoButton = new GButton(this, 356, 216, 80, 30);
  playPianoButton.setText("Play Piano");
  playPianoButton.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  playPianoButton.addEventHandler(this, "playPianoButton_click");
}

// Variable declarations 
// autogenerated do not edit
GButton metro; 
GSlider metroSpeed; 
GButton recordButton; 
GButton stopRecord; 
GDropList Saved_Songs; 
GTextField Song_Name; 
GButton oneSecondBack; 
GButton pausePlayingSongButton; 
GButton oneSecondForward; 
GButton startPlayingSongButton; 
GButton pitchUpButton; 
GButton pitchDownButton; 
GButton playSongButton; 
GButton goBackButton; 
GButton playPianoButton; 
