defmodule ConnectFour.WinChecker.OrthogonalHigherOrder do
  def check_horizontal(board) do
    Enum.filter(board, fn(row) -> eval_row(row) end)
    |> Enum.any?(fn(res) -> res end)
  end
  
  # If the row has 4 consecutive, return [n: 4, prev: c] where c is the winning
  # color
  def eval_row(row) do
    Enum.reduce(row, [n: 0, prev: 0], fn(cell, acc) -> eval_cell(acc, cell) end)
    |> is_there_a_win
  end
  
  def is_there_a_win([n: 4, prev: _]) do
    true
  end
  
  def is_there_a_win(_) do
    false
  end
  
  # If a match has already been found, just pass that along
  def eval_cell([n: 4, prev: a], _) do
    [n: 4, prev: a]
  end
  
  # param
  #  dict acc
  #    n: current number of accumulated consecutive cells
  #    prev: color of previous cell
  # param
  #  cell: current cell color
  def eval_cell(acc, cell) do
    [n: next_n(acc, cell), prev: cell]
  end
  
  # update the number of consecutive same-colored cells 
  def next_n(_, 0) do
    0
  end
  
  def next_n([n: n, prev: 0], a) do
    1
  end
  
  def next_n([n: n, prev: a], a) do
    n + 1
  end
  
  def next_n([n: _, prev: a], b) do
    0
  end
end
