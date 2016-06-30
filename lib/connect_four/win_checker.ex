defmodule ConnectFour.WinChecker do
  def check(board) do
    ConnectFour.Orthogonal.check_both(board)
  end
end
