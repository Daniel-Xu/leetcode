defmodule BadVersion do
  def run(nums) do
    process(nums, 0, length(nums) - 1)
  end

  defp process(nums, left, fight) when left <= right do
    mid = div(left + right, 2)

    case isBadVersion(mid) do
      true ->
        process(nums, left, mid - 1)
      false ->
        process(nums, mid + 1, right)
    end
  end
  defp process(nums, left, _right), do: left

  defp isBadVersion(i), do: false
end
