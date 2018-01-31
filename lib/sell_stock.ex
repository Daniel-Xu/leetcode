defmodule SellStock do
  def run(nums) do
    process(nums, [], 0)
  end

  @doc """
  [7, 1, 5, 3, 6, 4]
  DP
  sub problem: profit at day i - 1 sell/not sell
  7, 1, 5, 3, 6 | 4 -> 4 => 4 - 1 = 3

  """
  def process([h | t], [], max), do: process(t, [h], max)
  def process([], _pre, max), do: max

  def process([h | t], pre, max) do
    max = Enum.max([h - Enum.min(pre), max])
    process(t, [h | pre], max)
  end
end
