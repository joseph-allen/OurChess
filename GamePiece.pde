class GamePiece {  
  Type type;
  int player = -1;
  // set flags for arbitary rules
  HashSet<String> flags;
  GamePiece(Type type_) {
    type = type_;
    flags = new HashSet<String>();
  }
  void addFlag(String f) {
    if (!flags.contains(f)) flags.add(f);
  }
  void remFlag(String f) {
    if (flags.contains(f)) flags.remove(f);
  }
  boolean hasFlag(String f) {
    return flags.contains(f);
  };
  GamePiece setPlayer(int i) {
    player = i;
    return this;
  }
  // draw this, treat this as if it just draws the object at 0,0
  // and position can be controled from the outside, ie the board renderer
  void render() {
  }
  void debugRender() {
    textSize(20);
    text(type.toString(),0,20);
    text("Player: " + player,0,40);
    if (flags.size() != 0) {
      int i = 60;
      for (String f : flags) {
        text(f,20,i);
        i+=20;
      }
    }
  }
  // this might help if we make some sort of game history
  GamePiece copy() {
    GamePiece result = new GamePiece(type).setPlayer(player);
    if (flags.size() > 0) for (String f : flags) result.addFlag(f);
    return result;
  }
}