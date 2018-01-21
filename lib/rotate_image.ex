defmodule RotateImage do
  def run(matrix) do
    transpose(matrix)
    |> Enum.map(&Enum.reverse/1)
  end

  def transpose(matrix) do
    Enum.zip(matrix)
    |> Enum.map(&Tuple.to_list/1)
  end
end
