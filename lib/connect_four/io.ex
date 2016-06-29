defmodule ConnectFour.IO do
  def display_board(board) do
    IO.inspect board
  end
  
  def translate_player(turn) do
    case turn do
      1 ->
        "O"
      -1 ->
        "@"
      _ ->
        ""  
    end
  end
  
  def get_move(turn) do
    IO.gets(:stdio, "[#{translate_player(turn)}] Enter move: ")
    |> String.trim
    |> validate_move
  end
  
  def validate_move(move) do
    if String.match?(move, ~r/[0-5]/) do
      {:ok, String.to_integer(move)}    
    else
      {:error}
    end
  end
end
