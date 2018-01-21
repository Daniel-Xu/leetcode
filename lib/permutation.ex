defmodule Permutation do
  def run(nums) do
    process(nums)
  end

  def process([]), do: [[]]
  def process(nums) do
    for x <- nums, y <- process(List.delete(nums, x)), do: [x | y]
  end
end
