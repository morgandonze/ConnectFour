defmodule ConnectFour.BoardTest do
  use ExUnit.Case
  doctest ConnectFour.Board
  
  test "#replace_column" do
    board = ConnectFour.Board.new
    new_col = {1, 0, 0, 0, 0, 0}
    assert ConnectFour.Board.replace_column(new_col, board, 0) ==
      {{1, 0, 0, 0, 0, 0},
       {0, 0, 0, 0, 0, 0},
       {0, 0, 0, 0, 0, 0},
       {0, 0, 0, 0, 0, 0},
       {0, 0, 0, 0, 0, 0},
       {0, 0, 0, 0, 0, 0},}
  end
  
  test "#update_column" do
    col = {0, 0, 0, 0, 0, 0}
    assert ConnectFour.Board.update_column(col, 0, 1) ==
      {1, 0, 0, 0, 0, 0}
  end
  
  test "#insert_piece" do
    board = ConnectFour.Board.new
    assert ConnectFour.Board.insert_piece(board, 2, 0, 1) ==
      {{0, 0, 0, 0, 0, 0},
       {0, 0, 0, 0, 0, 0},
       {1, 0, 0, 0, 0, 0},
       {0, 0, 0, 0, 0, 0},
       {0, 0, 0, 0, 0, 0},
       {0, 0, 0, 0, 0, 0},}
  end
end
