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

synchronized public void win_draw1(PApplet appc, GWinData data) { //_CODE_:window1:261396:
  appc.background(230);
} //_CODE_:window1:261396:

public void button1_click1(GButton source, GEvent event) { //_CODE_:pitchDownButton:297869:
  pitch = max(1, pitch-1);
} //_CODE_:pitchDownButton:297869:

public void pitchUpButton_click(GButton source, GEvent event) { //_CODE_:pitchUpButton:215784:
  pitch = min(7, pitch+1);
} //_CODE_:pitchUpButton:215784:

public void changeVolumn(GSlider source, GEvent event) { //_CODE_:vol:770976:
  volume = vol.getValueF();
} //_CODE_:vol:770976:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Sketch Window");
  window1 = GWindow.getWindow(this, "Window title", 0, 0, 240, 120, JAVA2D);
  window1.noLoop();
  window1.setActionOnClose(G4P.KEEP_OPEN);
  window1.addDrawHandler(this, "win_draw1");
  pitchDownButton = new GButton(window1, 143, 69, 80, 30);
  pitchDownButton.setText("Face text");
  pitchDownButton.addEventHandler(this, "button1_click1");
  pitchUpButton = new GButton(window1, 143, 22, 80, 30);
  pitchUpButton.setText("Pitch Up");
  pitchUpButton.addEventHandler(this, "pitchUpButton_click");
  vol = new GSlider(window1, 10, 16, 100, 40, 10.0);
  vol.setLimits(50.0, 0.0, 100.0);
  vol.setNumberFormat(G4P.DECIMAL, 2);
  vol.setOpaque(false);
  vol.addEventHandler(this, "changeVolumn");
  label1 = new GLabel(window1, 13, 14, 89, 20);
  label1.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label1.setText("Volume Slider");
  label1.setOpaque(false);
  window1.loop();
}

// Variable declarations 
// autogenerated do not edit
GWindow window1;
GButton pitchDownButton; 
GButton pitchUpButton; 
GSlider vol; 
GLabel label1; 
