void mousePressed() {
  // Check if mouse click is within the rectangle, and change the value of canPlay, which determine if the keys will play notes or not
  if (mouseX >= 150 && mouseX <= 650 && mouseY >= 300 && mouseY <= 350) {
    canPlay = false;
  } 
  else {
    canPlay = true;
  }
}
