defmodule ContainsDup do
  def run([]), do: false

  def run(nums) do
    Enum.reduce_while(nums, {false, MapSet.new()}, fn x, {_, acc} ->
      if MapSet.member?(acc, x),
        do: {:halt, {true, acc}},
        else: {:cont, {false, MapSet.put(acc, x)}}
    end)
    |> elem(0)
  end
end
