defmodule ConnectFour.IO do
  def display_board(board) do
    [h|t] = prepare_board(board)
    display_board(h, t)
  end
  
  def prepare_board(board) do
    Listify.listify(board)
    |> Antitranspose.antitranspose
  end
  
  def display_board(row, []) do
    display_row(row)
  end
  
  def display_board(row, remaining) do
    display_row(row)
    [next_row | next_remaining] = remaining
    display_board(next_row, next_remaining)
  end
  
  def display_row(row) do
    [first_cell | other_cells] = row
    translate_player(first_cell)
    |> display_row(other_cells)
  end
  
  def display_row(accumulator, []) do
    IO.puts accumulator
  end
  
  def display_row(accumulator, remaining) do
    [first_cell | other_cells] = remaining
    display_row(accumulator <> translate_player(first_cell), other_cells)
  end
  
  def translate_player(turn) do
    case turn do
      1 ->
        "O "
      -1 ->
        "@ "
      _ ->
        ". "  
    end
  end
  
  def get_move(turn) do
    IO.gets(:stdio, "[#{translate_player(turn)}] Enter move: ")
    |> String.trim
    |> validate_move
  end
  
  def validate_move(move) do
    cond do
      String.match?(move, ~r/[0-5]/) ->
        {:ok, String.to_integer(move)}    
      String.match?(move, ~r/q(uit)?/) ->
        {:quit}
      true ->
        {:error}
    end
  end
end
