defmodule Subset do
  def run(nums) do
    process(nums) |> Enum.sort()
  end

  @doc """
  [1, 2, 3]

  [2], [3], [2, 3]
  [1, 2] [1, 3] [1, 2, 3]

  subset II

  [1, 2, 2]
  [2, 2]
  [2], [2], [2, 2]
  """

  defp process([]), do: [[]]
  defp process([h | t])  do
    res = process(t)
    (for x <- res, do: [h | x]) ++ res
  end
end
