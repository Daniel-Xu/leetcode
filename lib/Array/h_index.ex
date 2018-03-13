defmodule HIndex do
  @doc """
  This is a counting sort algorithm

  [3, 0, 6, 1, 5]

  assuming h is the index:

  paper_n(3) + paper_(5) > h

  so the easist thing to do is counting the number of each paper:
             0 1 2 3 4 5
  occurence  1 1 0 1 0 2

  0 occurs once, index 5 means paper citation >= 5, so it occurs twice
  """
  def run(nums) do
    len = length(nums)
    count = Enum.reduce(nums, %{}, fn x, acc ->
      x = if x > len, do: len, else: x
      Map.update(acc, x, 1, &(&1 + 1))
    end)

    Enum.reduce_while(len..0, 0, fn x, res ->
      res = (count[x] || 0) + res
      if res >= x, do: {:halt, res}, else: {:cont, res}
    end)
  end

  @doc """
  1. sort the list first
  2, [0 1 3 5 6]
     <-  h   ->
  assuming index = 0, as we need maxmum h, so we start from index = 0
  now, we have len - index = 5 of elements on the right (including 0)

  if let h = len - num[i] (aka 5), then it requires that:
  A scientist has index 5 if 5 of his/her 5 papers have at least 5 citations each
  aka: nums[i] must >= 5 (apparently 0 < 5)

  so we need to do this again, i = 1
  h = 5 - 1 = 4

  [0 1 3 5 6]
     <-  h ->
  1 < 4, keep going...
  """
  def run2(nums) do
    nums = Enum.sort(nums)

    process(nums, 0, length(nums) - 1)
  end

  defp process(nums, left, right) when left <= right do
    mid = div(left + right, 2)
    len = length(nums)
    case Enum.at(nums, mid) do
      v when v == len - mid ->
        len - mid
      v when v > len - mid ->
        process(nums, left, mid - 1)
      _ ->
        process(nums, mid + 1, right)
    end
  end
  defp process(nums, left, _right), do: length(nums) - left
end
