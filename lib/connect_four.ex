defmodule ConnectFour do
  def play do
    state = %{
      turn: 1,
      board: ConnectFour.Board.new,
    }
    do_turn(state)
  end
  
  def do_turn(state) do
    display_board(state[:board])
    
    case get_move(state[:turn]) do
      {:ok, move} ->
        # do stuff
        new_board = ConnectFour.update_board(state[:board], move, player)
      {:error} ->
        # do error stuff
        IO.puts("Invalid move")
    end
    
  end
  
  def get_move(turn) do
    IO.gets(:stdio, "[#{translate_player(turn)}] Enter move: ")
    |> String.trim
    |> validate_move
  end
  
  def validate_move(move) do
    if String.match?(move, ~r/\d/) do
      {:ok, move}    
    else
      {:error}
    end
  end
  
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
  
end
