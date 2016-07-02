defmodule ConnectFour do
  def start(_type, _args) do
    state = %{
      turn: 1,
      board: ConnectFour.Board.new,
    }
    do_turn(state)
    Supervisor.start_link [], strategy: :one_for_one # via Jose Valim - http://stackoverflow.com/questions/30687781/how-to-run-elixir-application#comment49441617_30688873
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
        if ConnectFour.WinChecker.check(new_state[:board]) do
          ConnectFour.IO.display_board(new_state[:board])
          IO.puts "Player #{ConnectFour.IO.translate_player(state[:turn])} wins!"
        else  
          do_turn(new_state)
        end
    end
  end
  
  defp new_state(old_state, new_board) do
    %{
      turn: -1 * old_state[:turn],
      board: new_board
    }
  end
end
