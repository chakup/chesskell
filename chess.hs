module Chess where

type Board = [[Square]]

initialBoardStr =
  unlines
    [ "rnbqkbnr",
      "pppppppp",
      "        ",
      "        ",
      "        ",
      "        ",
      "pppppppp",
      "RNBQKBNR"
    ]

readBoard :: String -> Board
readBoard = map readRow . lines
  where
    readRow = map readSquare

showBoard :: Board -> String
showBoard = unlines . map showRow
  where
    showRow = map showSquare

type Square = Maybe Piece

-- | Show a square using FEN notation or ' ' for an empty square
showSquare :: Square -> Char
showSquare = maybe ' ' showPiece

readSquare :: Char -> Square
readSquare ' ' = Nothing
readSquare c = Just (readPiece c)

data Piece = Piece PColor PType deriving (Show)

data PColor = White | Black deriving (Show)

data PType = Pawn | Knight | Bishop | Rook | Queen | King deriving (Show)

-- | Shows a piece using FEN notation
--
-- * Black pieces are "pnbrag"
-- * Black pieces are "PNBRAG"
showPiece :: Piece -> Char
showPiece (Piece White Pawn) = 'P'
showPiece (Piece White Knight) = 'N'
showPiece (Piece White Bishop) = 'B'
showPiece (Piece White Rook) = 'R'
showPiece (Piece White Queen) = 'Q'
showPiece (Piece White King) = 'K'
showPiece (Piece Black Pawn) = 'p'
showPiece (Piece Black Knight) = 'n'
showPiece (Piece Black Bishop) = 'b'
showPiece (Piece Black Rook) = 'r'
showPiece (Piece Black Queen) = 'q'
showPiece (Piece Black King) = 'k'

readPiece :: Char -> Piece
readPiece 'P' = (Piece White Pawn)
readPiece 'N' = (Piece White Knight)
readPiece 'B' = (Piece White Bishop)
readPiece 'R' = (Piece White Rook)
readPiece 'Q' = (Piece White Queen)
readPiece 'K' = (Piece White King)
readPiece 'p' = (Piece Black Pawn)
readPiece 'n' = (Piece Black Knight)
readPiece 'b' = (Piece Black Bishop)
readPiece 'r' = (Piece Black Rook)
readPiece 'q' = (Piece Black Queen)
readPiece 'k' = (Piece Black King)
