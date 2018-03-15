defmodule MiniSubarraySum do
  @inital_max 1000
  @doc """
  The sum array keeps increasing, so elements are unique
  """
  def run(nums, k) do
    len =
      Enum.with_index(nums)
      |> Enum.reduce({0, @inital_max, %{}}, fn {x, i}, {sum, acc, m} ->
        sum = sum + x
        acc = if sum >= k do
          pre_i = Enum.find(m, fn {x, i} -> x >= sum-k end)
          pre_i = pre_i && elem(pre_i, 1)
          pos = if pre_i, do: [i+1, acc, i-pre_i], else: [i+1, acc]
          Enum.min(pos)
        else
          acc
        end
        m = Map.put(m, sum, i)
        {sum, acc, m}
      end)
      |> elem(1)

    if len == @inital_max, do: 0, else: len
  end

  @doc """
  sliding window like minium substring
  [1, 2 ,3 , 4, 5]
  ^    ^
  """
  def run2(nums, k) do
    process(nums, k, 0, 0, 0, @inital_max)
  end

  defp process(nums, k, left, right, sum, acc) when right < length(nums) do
    sum = sum + Enum.at(nums, right)
    right = right + 1

    {sum, left, right, acc} = shrink_window(nums, k, sum, left, right, acc)
    process(nums, k, left, right, sum, acc)
  end
  defp process(_nums, _k, _left, _right, _sum, acc) when acc == @inital_max, do: 0
  defp process(_nums, _k, _left, _right, _sum, acc), do: acc

  defp shrink_window(nums, k, sum, left, right, acc) when sum >= k do
    acc = if right - left < acc, do: right - left, else: acc
    sum = sum - Enum.at(nums, left)
    shrink_window(nums, k, sum, left + 1, right, acc)
  end
  defp shrink_window(nums, k, sum, left, right, acc), do: {sum, left, right, acc}
end
