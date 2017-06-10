import java.util.HashSet;
GameBoard board;

void setup() {
  size(800,800);
  Type.init();
  board = new GameBoard(8,8);
}
void draw() {
  background(0,255,0);
  // just temporary..
  board.debugDraw();
  board.debugMove((int)random(board.boardWidth),(int)random(board.boardHeight),(int)random(board.boardWidth),(int)random(board.boardHeight));
}

// Piece types, with symbols
static enum Type {
  QUEEN('Q'), KING('K'), BISHOP('B'), KNIGHT('N'), ROOK('R'), PAWN('P');
  private char symbol;
  private static HashMap<Character, Type> charMap;
  private Type(char symbol_) {
    symbol = symbol_;
  }
  public static void init() {
    charMap = new HashMap<Character, Type>();
    for (Type t : Type.values()) charMap.put(t.symbol,t);
  }
  public static Type getType(char symbol) {
    return charMap.get(symbol);
  }
}