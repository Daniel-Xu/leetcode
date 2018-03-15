defmodule SubArraySumToK do
  def run(nums, k) do
    Enum.with_index(nums)
    |> Enum.reduce({0, 0, %{}}, fn {x, i}, {sum, acc, m} ->
      sum = sum + x
      acc = if sum == k, do: acc + 1, else: acc
      acc = if m[sum-k], do: MapSet.size(m[sum-k]) + acc, else: acc
      m = Map.update(m, sum, MapSet.new([i]), &(MapSet.put(&1, i)))

      {sum, acc, m}
    end)
    |> elem(1)
  end
end
