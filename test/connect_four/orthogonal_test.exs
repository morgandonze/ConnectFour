defmodule ConnectFour.OrthogonalTest do
  use ExUnit.Case
  doctest ConnectFour.Orthogonal
  
  test "#check_row(cell, [], last, matching)" do
    assert !ConnectFour.Orthogonal.check_row(1, [], 1, 1)
    assert ConnectFour.Orthogonal.check_row(1, [], 1, 3)
  end
  
  test "#check_row(cell, remaining, last, matching)" do
    assert !ConnectFour.Orthogonal.check_row(1, [1,1,0,0,0], 0, 0)
    assert !ConnectFour.Orthogonal.check_row(0, [1,1,1,0,0], 0, 0)
    assert ConnectFour.Orthogonal.check_row(1, [1,1,1,0,0], 0, 0)
  end
  
  test "#check_row/1" do
    assert !ConnectFour.Orthogonal.check_row([0,0,0,0,0,0])
    assert !ConnectFour.Orthogonal.check_row([0,1,0,1,1,1])
    assert !ConnectFour.Orthogonal.check_row([0,-1,-1,1,-1,0])
    assert ConnectFour.Orthogonal.check_row([0,1,1,1,1,0])
    assert ConnectFour.Orthogonal.check_row([0,-1,-1,-1,-1,0])
  end
  
  test "#check_horizontal" do
    board = [[0,0,0,0,0,0],
             [0,0,0,0,0,0],
             [0,0,0,0,0,0],
             [0,0,0,0,0,0],
             [0,0,0,0,0,0],
             [0,1,1,1,1,0]]
    assert ConnectFour.Orthogonal.check_horizontal(board)
    
    board = [[0,0,0,0,0,0],
             [0,0,0,0,0,0],
             [0,0,0,0,0,0],
             [0,1,1,1,1,0],
             [0,0,0,0,0,0],
             [0,0,0,0,0,0]]
    assert ConnectFour.Orthogonal.check_horizontal(board)
    
    board = [[0,0,0,0,0,0],
             [0,0,0,0,0,0],
             [0,0,0,0,0,0],
             [0,0,0,0,0,0],
             [0,0,0,0,0,0],
             [0,1,-1,1,1,0]]
    assert !ConnectFour.Orthogonal.check_horizontal(board)
    
    board = [[0,0,0,0,0,0],
             [0,0,0,0,0,0],
             [0,1,0,0,0,0],
             [0,1,0,0,0,0],
             [0,1,0,0,0,0],
             [0,1,-1,1,1,0]]
    assert !ConnectFour.Orthogonal.check_horizontal(board)
  end
end
