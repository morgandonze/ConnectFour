defmodule ConnectFour.Diagonal3 do
  def add_item(item, item_rem, [], matrix_rem, range) do
    [h|t] = matrix_rem
    add_item(item, item_rem, h, t, range)
  end
  
  def add_item(item, [], acc, [], _) do
    pos = Enum.count(acc)
    List.insert_at(acc, pos, [item])
  end  
  
  def add_item(item, item_rem, acc, [], _) do
    [ih | it] = item_rem
    add_item(ih, it, [acc | item], [], 0)
  end  
  
  def add_item(item, item_rem, acc, matrix_rem, range) do
    [mh | mt] = matrix_rem
    cond do
      Enum.size(matrix_rem) >= Enum.min(range) &&
      Enum.size(matrix_rem) <= Enum.max(range) ->
        [ih | it] = item_rem
        add_item(ih, it, [acc, [mh | item]], mt, range)  
      true ->
        add_item(item, item_rem, [acc, mh], mt, range)
    end
  end  
end
