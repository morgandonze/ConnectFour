defmodule ConnectFour.WinChecker do
  def check(tuple_board) do
    board = Listify.listify(tuple_board)
    ConnectFour.Orthogonal.check_both(board) ||
      ConnectFour.Diagonal.check(board)
  end
end
