defmodule ConnectFour.Diagonal do
  def check(board) do
    check_descending(board) || check_ascending(board)
  end
  
  def check_descending(board) do
    ConnectFour.Diagonalize.diagonalize(board)
    |> ConnectFour.Orthogonal.check_vertical
  end
  
  def check_ascending(board) do
    Enum.reverse(board)
    |> ConnectFour.Diagonalize.diagonalize
    |> ConnectFour.Orthogonal.check_vertical
  end
end
