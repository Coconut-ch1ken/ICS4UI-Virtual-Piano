class Note {
  String note;
  int pitch;
  AudioPlayer player;
  
  Note(String n, int p, AudioPlayer ap) {
    this.note = n;
    this.pitch = p;
    this.player = ap;
  }
  
  void play() {
    player.rewind();
    player.play();
  }
}
