defmodule MaxSubArraySum do
  @doc """
  [1, -1, 5, -2, 3], k = 3
  return 4. (subarray [1, -1, 5, 3] => sum to 3 and is the longest)

  [-2, -1, 2, 1], k = 1
  return 2 ([-1, 2])

  how to think?

  [1, -1, 5, -2, 3] k = 3

  calculate sum
  [1, 0, 5, 3, 6]

  [x, x, x, x ,x ,x, ,x ,x ,x ]
  <-       sum(i, j)         ->

  [x, x, x, x ,x ,x, ,x ,x ,x ]
  <-sum(0, i) -> <-sum(i, j)->

  sum(i, j) = sum[0, j] - sum[0, i)

        1 -1 5 -2 3
  sum   1  0 5  3 6
  index 0  1 2  3 4

  when sums[i] - k = x when x is in sums with index j
  then it can be [j+1, j+2 .. i] to be the array

  """
  def run(nums, target) do
    Enum.with_index(nums)
    |> Enum.reduce({0, 0, %{}}, fn {x, i}, {sum, acc, m} ->
      sum = sum + x
      acc =
        if sum == target do
          i+1
        else
          if m[sum - target], do: Enum.max([acc, i - m[sum-target]]), else: acc
        end
      m = Map.update(m, sum, i, &(&1))
      {sum, acc, m}
    end)
    |> elem(1)
  end
end
