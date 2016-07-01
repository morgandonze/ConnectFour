defmodule ConnectFour.Diagonal3Test do
  use ExUnit.Case
  doctest ConnectFour.Diagonal3
  
  test "#add_item" do
    assert ConnectFour.Diagonal3.add_item(2, [], [[7],[4,8],[1,5]], [], [1,2]) == [[7],[4,8],[1,5],[2]]
  end
end
