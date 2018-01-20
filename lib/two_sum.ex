defmodule TwoSum do
  def run(nums, target) do
    Enum.with_index(nums)
    |> process(target, false, [])
  end

  def process([], target, true, acc), do: acc
  def process([{h_v, h_i} | t], target, stop, acc) do
    value = Enum.find(t, fn({v, _v_i}) -> v + h_v == target end)
    if value == nil,
      do: process(t, target, stop, acc),
      else: process(t, target, true, [h_i, elem(value, 1)])
  end
  def process(_, _, _, _), do: []
end
