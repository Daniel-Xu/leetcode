defmodule KClosestElement do
  @doc """
  special binary search

  [1, 2, 3, 4, 5]
  <- k  ->

  why intial high value is length(nums) - k:
  -> this is to ensure that we have k number of elements

  do we need abs() for binary search:
  -> no, because, if x is on the left side of lo, then we should move the high towards low
  -> if x is on the right side of high, we should move the low towards high
  -> if x is in the middle of lo and high, then we should calculate the distance
  """
  def run(nums, k, x) do
    i = process(nums, k, x, 0, length(nums) - k)
    Enum.slice(nums, i, k)
  end

  defp process(nums, k, x, lo, hi) when lo < hi do
    mid = div(lo + hi, 2)
    {lo, hi} = if x - Enum.at(nums, mid) > Enum.at(nums, mid + k) - x, do: {lo+1, hi}, else: {lo, mid}

    process(nums, k, x, lo, hi)
  end
  defp process(_nums, _k, _x, lo, _hi), do: lo

end
