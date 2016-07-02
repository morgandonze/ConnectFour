defmodule Listify do
  def listify(matrix) do
    Tuple.to_list(matrix)
    |> listify_row([])
  end
  
  def listify_row([], result) do
    IO.inspect result
    Enum.reverse(result)
  end
  
  def listify_row(tuple_list, result) do
    [first_tuple | other_tuples] = tuple_list
    new_result = [Tuple.to_list(first_tuple) | result]
    listify_row(other_tuples, new_result)
  end
end
