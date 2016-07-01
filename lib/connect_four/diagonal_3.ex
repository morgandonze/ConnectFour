defmodule ConnectFour.Diagonal3 do
  def add_item(item, [], acc, [], _) do
    pos = Enum.count(acc)
    List.insert_at(acc, pos, [item])
  end  
  
  def add_item(item, item_rem, acc, [], _) do
    [ih | it] = item_rem
    pos = Enum.count(acc)
    add_item(ih, it, List.insert_at(acc, pos, [item]), [], 0)
  end  
  
  def add_item(item, item_rem, acc, matrix_rem, range) do
    [mh | mt] = matrix_rem
    cond do
      Enum.count(matrix_rem) >= Enum.min(range) &&
      Enum.count(matrix_rem) <= Enum.max(range) ->
        [ih | it] = Enum.reverse(item_rem)
        pos = Enum.count(acc)
        mhpos = Enum.count(mh)
        new_row = List.insert_at(mh, mhpos, item) 
        new_acc = List.insert_at(acc, pos, new_row)
        
        add_item(ih, it, new_acc, mt, range)  
      true ->
        pos = Enum.count(acc)
        new_acc = List.insert_at(acc, pos, mh)
        add_item(item, item_rem, new_acc, mt, range)
    end
  end  
end
