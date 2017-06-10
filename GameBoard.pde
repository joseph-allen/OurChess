class GameBoard {
  boolean[] isTile;
  GamePiece[] board;
  int boardWidth, boardHeight, boardCells;
  GameBoard(int bWidth, int bHeight) {
    boardWidth = bWidth;
    boardHeight = bHeight;
    boardCells = boardWidth * boardHeight;
    // Pieces on the board
    board = new GamePiece[boardCells];
    // valid tiles for 'custom' boards
    isTile = new boolean[boardCells];
    // not implemented, just set all to valid
    for (int i = 0; i < isTile.length; i++) isTile[i] = true;
    init();
  }

  /*GameBoard( custom constructor? ) {
   }//*/

  void init() {
    clearBoard();
    place(true, 1, "RNBQKBNRPPPPPPPP");
    place(false, 2, "RNBKQBNRPPPPPPPP");
  }

  void clearBoard() {
    for (int i = 0; i < board.length; i++) board[i] = null;
  }

  // place pieces belonging to a player, from either top or bottom
  // top fills from top left, bottom fills from bottom right (ie rotate board 180) 
  void place(boolean top, int player, String pieces) {
    // Dont overrun board or pieces string
    int maxLoop =min(pieces.length(), boardWidth*boardHeight);
    for (int i = 0; i < maxLoop; i++) {
      int i0 = top?i:boardCells-i-1;
      // isn't valid, skip
      if (!isTile[i0]) continue;
      Type pieceType = Type.getType(pieces.charAt(i));
      // create a new GamePiece with player
      if (pieceType != null) board[i0] = new GamePiece(pieceType).setPlayer(player);
    }
  }

  // return false, if move was invalid, otherwise make the change
  /*
  boolean move(int fromX, int fromY, int toX, int toY) {
   switch ( GamePiece.type @ from(x,y) ) {
   case (QUEEN) :
   case (KING) :
   etc...
   }
   }
   // for movement using G1F3 G1 to F3  
   boolean move(String move) {
   }
  //*/
  boolean debugMove(int x0, int y0, int x1, int y1) {
    // this just automoves for testing
    if (x0 < 0 || x0 >= boardWidth || y0 < 0 || y0 >= boardHeight) return false;
    if (x1 < 0 || x1 >= boardWidth || y1 < 0 || y1 >= boardHeight) return false;
    int i0 = x0 + y0 * boardWidth;
    int i1 = x1 + y1 * boardWidth;
    GamePiece temp = board[i0];
    board[i0] = board[i1];
    board[i1] = temp;
    return true;
  }
  void debugDraw() {
    float wSize = float(width)/boardWidth;
    float hSize = float(height)/boardHeight;
    for (int i = 0; i < board.length; i++) {
      int x = i % boardWidth;
      int y = i / boardWidth;
      
      pushMatrix();
       translate(x*wSize,y*hSize);
       if (isTile[i]) {
        fill(((x^y)&1)*255);
        rect(0,0,wSize,hSize);
        if (board[i] == null) {
          fill(255,0,0);
          text("No Piece",0,20);
        } else {
          fill(255,255,0);
          board[i].debugRender();
        }
       }
      popMatrix();
    }
  }
}