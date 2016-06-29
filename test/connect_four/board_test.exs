defmodule ConnectFour.BoardTest do
  use ExUnit.Case
  doctest ConnectFour.Board
  
  test "#update_board" do
    board = {{0, 0, 0, 0, 0, 0},
             {0, 0, 0, 0, 0, 0},
             {0, 0, 0, 0, 0, 0},
             {0, 0, 0, 0, 0, 0},
             {0, 0, 0, 0, 0, 0},
             {0, 0, 0, 0, 0, 0},}
    assert ConnectFour.Board.update_board(board, 1, 1) ==
            {{0, 0, 0, 0, 0, 0},
             {1, 0, 0, 0, 0, 0},
             {0, 0, 0, 0, 0, 0},
             {0, 0, 0, 0, 0, 0},
             {0, 0, 0, 0, 0, 0},
             {0, 0, 0, 0, 0, 0},}
       
    board = {{1, 1, 1, 0, 0, 0},
             {0, 0, 0, 0, 0, 0},
             {1, 1, 1, 1, 0, 0},
             {0, 0, 0, 0, 0, 0},
             {1, 1, 0, 0, 0, 0},
             {0, 0, 0, 0, 0, 0},}
    assert ConnectFour.Board.update_board(board, 4, 1) ==
            {{1, 1, 1, 0, 0, 0},
             {0, 0, 0, 0, 0, 0},
             {1, 1, 1, 1, 0, 0},
             {0, 0, 0, 0, 0, 0},
             {1, 1, 1, 0, 0, 0},
             {0, 0, 0, 0, 0, 0},}
             
    board = {{1, 1, 1, 0, 0, 0},
             {0, 0, 0, 0, 0, 0},
             {1, 1, 1, 1, 0, 0},
             {0, 0, 0, 0, 0, 0},
             {1, 1, 0, 0, 0, 0},
             {0, 0, 0, 0, 0, 0},}
    assert ConnectFour.Board.update_board(board, 4, 1) ==
            {{1, 1, 1, 0, 0, 0},
             {0, 0, 0, 0, 0, 0},
             {1, 1, 1, 1, 0, 0},
             {0, 0, 0, 0, 0, 0},
             {1, 1, 1, 0, 0, 0},
             {0, 0, 0, 0, 0, 0},}
             
    board = {{1, 1, 1, 0, 0, 0},
             {0, 0, 0, 0, 0, 0},
             {1, 1, 1, 1, 0, 0},
             {0, 0, 0, 0, 0, 0},
             {1, 1, 0, 0, 0, 0},
             {0, 0, 0, 0, 0, 0},}
    assert ConnectFour.Board.update_board(board, 3, -1) ==
            {{1, 1, 1, 0, 0, 0},
             {0, 0, 0, 0, 0, 0},
             {1, 1, 1, 1, 0, 0},
             {-1, 0, 0, 0, 0, 0},
             {1, 1, 0, 0, 0, 0},
             {0, 0, 0, 0, 0, 0},}
  end
  
  # test "#find_top" do
  #   col = {1, 1, 1, 0, 0, 0}
  #   assert ConnectFour.Board.find_top(col) == {:ok, 3}
  #   
  #   col = {1, 1, 1, 1, 0, 0}
  #   assert ConnectFour.Board.find_top(col) == {:ok, 4}
  #   
  #   col = {1, 1, 1, 1, 1, 1}
  #   assert ConnectFour.Board.find_top(col) == {:error}
  # end
  # 
  # test "#replace_column" do
  #   board = ConnectFour.Board.new
  #   new_col = {1, 0, 0, 0, 0, 0}
  #   assert ConnectFour.Board.replace_column(new_col, board, 0) ==
  #     {{1, 0, 0, 0, 0, 0},
  #      {0, 0, 0, 0, 0, 0},
  #      {0, 0, 0, 0, 0, 0},
  #      {0, 0, 0, 0, 0, 0},
  #      {0, 0, 0, 0, 0, 0},
  #      {0, 0, 0, 0, 0, 0},}
  # end
  # 
  # test "#update_column" do
  #   col = {0, 0, 0, 0, 0, 0}
  #   assert ConnectFour.Board.update_column(col, 0, 1) ==
  #     {1, 0, 0, 0, 0, 0}
  # end
  # 
  # test "#insert_piece" do
  #   board = ConnectFour.Board.new
  #   assert ConnectFour.Board.insert_piece(board, 2, 1) ==
  #     {{0, 0, 0, 0, 0, 0},
  #      {0, 0, 0, 0, 0, 0},
  #      {1, 0, 0, 0, 0, 0},
  #      {0, 0, 0, 0, 0, 0},
  #      {0, 0, 0, 0, 0, 0},
  #      {0, 0, 0, 0, 0, 0},}
  #      
  #   assert ConnectFour.Board.insert_piece(board, 5, 1) ==
  #     {{0, 0, 0, 0, 0, 0},
  #      {0, 0, 0, 0, 0, 0},
  #      {0, 0, 0, 0, 0, 0},
  #      {0, 0, 0, 0, 0, 0},
  #      {0, 0, 0, 0, 0, 0},
  #      {1, 0, 0, 0, 0, 0},}
  # end
end
