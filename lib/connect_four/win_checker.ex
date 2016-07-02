defmodule ConnectFour.WinChecker do
  def check(tuple_board) do
    board = Listify.listify(tuple_board)
    ConnectFour.WinChecker.Orthogonal.check_both(board) ||
      ConnectFour.WinChecker.Diagonal.check(board)
  end
end
