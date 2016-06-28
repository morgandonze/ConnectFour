defmodule ConnectFour.Board do
  def new do
    [
      [0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0],
      [0, 0, 0, 0, 0, 0],
    ]
  end
  
  def update_board(board, move, player) do
    col = old_board[move]
    case find_top(col) do
      {:ok, n} ->
        # make move
        {:ok, List.replace_at(board, n, player)}
      _ ->
        {:error}
    end
    
  end
  
  defp find_top(col, n=0) do
    [h|t] = col
    cond do
      h <> 0 ->
        {:ok, n}
      t.any? ->
        {:ok, find_top(t, n+1)}
      _ ->
        {:error}
    end
  end
end
