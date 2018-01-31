defmodule MostWater do
  @doc """

  0 1 2 3 4 5 6 7

  d(i, j)
  d(0, 1) -> (1 - 0) * min(a(0), a(1))
  d(0, 2) -> (2 - 0)  * min(a(2), a(0))
  d(0, 7)
  d(1, 2)

  """
  def run(heights) do
    n = length(heights)

    Enum.reduce(1..(n - 1), 0, fn i, max ->
      Enum.reduce(0..(i - 1), max, fn j, max ->
        w = (i - j) * Enum.min([Enum.at(heights, i), Enum.at(heights, j)])
        if w > max, do: w, else: max
      end)
    end)
  end
end
