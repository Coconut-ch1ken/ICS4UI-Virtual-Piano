void mousePressed() {
  // Check if mouse click is within the rectangle
  if (mouseX >= 150 && mouseX <= 650 && mouseY >= 300 && mouseY <= 350) {
    canPlay = false;
  } 
  else {
    canPlay = true;
  }
}
