defmodule Subset2 do
  def run(nums) do
    process(nums) |> Enum.uniq() |> Enum.sort()
  end

  @doc """
  subset II
  [1, 2, 2]
  [2, 2]
  [2], [2], [2, 2]
  """
  defp process([]), do: [[]]
  defp process([h | t])  do
    res = process(t)
    ((for x <- res, do: [h | x]) |> Enum.uniq()) ++ res
  end
end
