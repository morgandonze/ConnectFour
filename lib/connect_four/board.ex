defmodule ConnectFour.Board do
  def new do
    { {0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0}, }
  end
  
  def update_board(board, move, player) do
    col = elem(board, move)
    case find_top(col) do
      {:ok, top} ->
        # make move
        {:ok, insert_piece(board, move, top, player)}
      _ ->
        {:error}
    end
    
  end
  
  def insert_piece(board, move, top, player) do
    col = elem(board, move)
    update_column(col, top, player)
    |> replace_column(board, move)
  end
  
  def update_column(col, top, player) do
    Tuple.delete_at(col, top)
    |> Tuple.insert_at(top, player)
  end
  
  def replace_column(col, board, move) do
    Tuple.delete_at(board, move)
    |> Tuple.insert_at(move, col)
  end
  
  defp find_top(col, n\\0) do
    col_list = Tuple.to_list(col)
    [h|t] = col_list
    cond do
      h != 0 ->
        {:ok, n}
      Enum.any?(t) ->
        {:ok, List.to_tuple(t) |> find_top(n+1)}
      true ->
        {:error}
    end
  end
end
