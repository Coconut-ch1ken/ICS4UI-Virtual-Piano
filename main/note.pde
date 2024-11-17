class Note {
  String note;
  int pitch;
  FilePlayer player;
  
  Note(String n, int p, FilePlayer fp) {
    this.note = n;
    this.pitch = p;
    this.player = fp;
    
  }
  
  void play() {
    this.player.rewind();
    
    this.player.play();
  }
}
