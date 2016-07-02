defmodule ConnectFour.WinChecker.Diagonal do
  def check(board) do
    check_descending(board) || check_ascending(board)
  end
  
  def check_descending(board) do
    Diagonalize.diagonalize(board)
    |> ConnectFour.WinChecker.Orthogonal.check_vertical
  end
  
  def check_ascending(board) do
    Enum.reverse(board)
    |> Diagonalize.diagonalize
    |> ConnectFour.WinChecker.Orthogonal.check_vertical
  end
end
