defmodule LongestIncreasingSeq do
  def run(nums) do
    tl(nums)
    |> process([{hd(nums), 1}], 1)
  end

  @doc """
  [5, 3, 4, 8, 6, 7]
  sub problem: d(n-1) include n,
  5 -> (5, 1)
  5, 3 -> %{(5, 1), (3, 1)}
  5, 3, 4 -> %{(5, 1), (3, 1), (4, 2)}
  5, 3, 4, 8 -> %{(5, 1), (3, 1), (4, 2), (8, 3)}
  5, 3, 5, 8, 6 -> %{(5, 1), (3, 1), (4, 2), (8, 3), (6, 3)}

  how do we calculate 6?
  we have a map in previous iteration %{(5, 1), (3, 1), (4, 2), (8, 3)}
  we found that 5, 3, 4 less than 6
  and the max is (4, 2) => 2 + 1 => (6, 3)
  """
  def process([], _current, max), do: max

  def process([h | t], current, max) do
    l =
      Enum.reduce(current, 0, fn {v, l}, acc ->
        l = if h > v, do: l + 1, else: l
        Enum.max([l, acc])
      end)

    process(t, [{h, l} | current], Enum.max([max, l]))
  end
end
