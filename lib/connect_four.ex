defmodule ConnectFour do
  def play do
    state = %{
      turn: 1,
      board: ConnectFour.Board.new,
    }
    do_turn(state)
  end
  
  def do_turn(state) do
    ConnectFour.IO.display_board(state[:board])
    
    res = with \
      {:ok, move} <- ConnectFour.IO.get_move(state[:turn]),
      {:ok, new_board} <- ConnectFour.Board.update_board(state[:board], move, state[:turn]),
    do:
      new_state(state, new_board)
      
    case res do
      {:error} ->
        IO.puts "error!"
        do_turn(state)
      {:quit} ->
        IO.puts "bye"
      new_state ->
        do_turn(new_state)
    end
  end
  
  defp new_state(old_state, new_board) do
    %{
      turn: -1 * old_state[:turn],
      board: new_board
    }
  end
end
