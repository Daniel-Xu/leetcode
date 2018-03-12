defmodule TwoSum do
  # def run(nums, target) do
  #   Enum.with_index(nums)
  #   |> process(target, false, [])
  # end

  # def process([], target, true, acc), do: acc

  # def process([{h_v, h_i} | t], target, stop, acc) do
  #   value = Enum.find(t, fn {v, _v_i} -> v + h_v == target end)

  #   if value == nil,
  #     do: process(t, target, stop, acc),
  #     else: process(t, target, true, [h_i, elem(value, 1)])
  # end

  # def process(_, _, _, _), do: []

  @doc """
  we can use two pointer, small and big
  if v[small] + v[big] > target,
  -> small++
  if v[small] + v[big] < target
  -> big--
  """
  def run([], _target), do: []
  def run(nums, target) do
    process(nums, target, 0, length(nums) - 1)
  end

  def process(_nums, _target, small, big) when small >= big, do: []
  def process(nums, target, small, big) do
    n = Enum.at(nums, small) + Enum.at(nums, big)
    case n do
      ^target -> [small, big]
      v when v > target -> process(nums, target, small, big-1)
      _ -> process(nums, target, small+1, big)
    end
 end
end
