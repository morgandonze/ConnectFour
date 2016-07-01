defmodule ConnectFour.Diagonal3Test do
  use ExUnit.Case
  doctest ConnectFour.Diagonal3
  
  test "#add_item" do
    result = [ [ 7], [4,8],[1,5],[2]]
    
    item = 2
    item_rem = []
    acc = [[7],[4,8],[1,5]]
    matrix_rem = []
    range = [1,2]
    assert ConnectFour.Diagonal3.add_item(item, item_rem, acc, matrix_rem, range) == result
    
    item = 5
    item_rem = [2]
    acc = [[7,],[4,8]]
    matrix_rem = [[1]]
    range = [1,2]
    assert ConnectFour.Diagonal3.add_item(item, item_rem, acc, matrix_rem, range) == result
    
    item = 8
    item_rem = [5,2]
    acc = []
    matrix_rem = [[7],[4],[1]]
    range = [1,2]
    assert ConnectFour.Diagonal3.add_item(item, item_rem, acc, matrix_rem, range) == result
  end
end
