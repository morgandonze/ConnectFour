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
        case ConnectFour.Board.update_board(state[:board], move, state[:turn]) do
          {:error} ->
            IO.puts("Invalid move")
            do_turn(state) # redundant; can we use `with`?
          {:ok, new_board} ->
            new_state(state, new_board)
            |> do_turn
        end
      {:error} ->
        # do error stuff
        IO.puts("Invalid move")
        do_turn(state)
    end
    
    # with \
    #   {:ok, move} <- get_move(state[:turn]),
    #   {:ok, new_board} <- ConnectFour.Board.update_board(state[:board], move, state[:turn]),
    # do:
    #   nil  
  end
  
  defp new_state(old_state, new_board) do
    %{
      turn: -1 * old_state[:turn],
      board: new_board
    }
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
