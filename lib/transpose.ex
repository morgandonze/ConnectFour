# Via http://langintro.com/elixir/article2/
defmodule Transpose do

  def transpose(m) do
    attach_row(m, [])
  end
  
  @doc """
  Given a matrix and a result, make the first row into a column,
  attach it to the result, and then recursively attach the
  remaining rows to that new result.
  
  When the original matrix has no rows remaining, the result
  matrix is complete, but each row needs to be reversed. 
  """
  def attach_row([], result) do
    reverse_rows(result, [])
  end
  
  def attach_row(row_list, result) do
    [first_row | other_rows] = row_list
    new_result = make_column(first_row, result, [])
    attach_row(other_rows, new_result)
  end

  @doc """
  Make a row into a column. The arguments are the items in the row,
  the current state of the transposed matrix, and the new state of
  the transposed matrix (the accumulator). The three clauses are as follows:
  
  When there are no more entries in the row, the column you are
  making is complete.

  Make the row into a column when the result matrix is empty.
  Do this by creating the first item as a singleton list
  and prepend it to the new state (the accumulator).

  Make a row into a column when the result matrix is not empty.
  Do this by prepending the first item in the row to the
  first row of the result state, and prepend that list to the new state.
  """
  def make_column([], _, new) do
   Enum.reverse(new)
  end
  
  def make_column(row, [], accumulator) do
    [row_head | row_tail] = row
    make_column(row_tail, [], [[row_head] | accumulator])
  end
  
  def make_column(row, result, accumulator) do
    [row_head | row_tail] = row
    [result_head | result_tail] = result
    make_column(row_tail, result_tail, [[row_head | result_head] | accumulator])
  end

  @doc """
  Reverse the order of items in each row of a matrix. This constructs
  a new matrix whose rows are in reverse order, so you need to reverse
  the final result.
  """
  def reverse_rows([], result) do
    Enum.reverse(result)
  end
  
  def reverse_rows([first|others], result) do
    reverse_rows(others, [Enum.reverse(first) | result])
  end
  
end
