defmodule Antitranspose do
  def antitranspose(m) do
    Enum.reverse(m)
    |> Transpose.transpose
    |> Enum.reverse
  end
end
