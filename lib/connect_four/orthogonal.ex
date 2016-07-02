defmodule ConnectFour.Orthogonal do
  def check_both(board) do
    check_vertical(board) || check_horizontal(board)
  end
  
  def check_vertical(board) do
    check(board, [])
  end
  
  def check_horizontal(board) do
    Transpose.transpose(board)
    |> check([])
  end
  
  def check([], row) do
    check_row(row)
  end
  
  def check(remaining, []) do
    [next_row | other_rows] = remaining
    check(other_rows, next_row)
  end
  
  def check(remaining, row) do
    if check_row(row) do
      true
    else
      [next_row | other_rows] = remaining
      check(other_rows, next_row)
    end
  end

  #pass
  def check_row(row) do
    [cell | other_cells] = row
    check_row(cell, other_cells, 0, 0)
  end
  
  # pass
  def check_row(cell, [], last, matching) do
    new_matching =
      if cell == last do
        matching + 1
      else
        1
      end
    new_matching == 4
  end
  
  # pass
  def check_row(cell, remaining, last, matching) do
    new_matching = 
      if cell == last && cell != 0 do
        matching + 1
      else
        1
      end
    if new_matching == 4 do
      true
    else
      [next_cell | other_cells] = remaining
      check_row(next_cell, other_cells, cell, new_matching)  
    end  
  end
end
