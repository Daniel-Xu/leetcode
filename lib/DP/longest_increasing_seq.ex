defmodule LongestIncreasingSeq do
  def run(nums) do
    tl(nums)
    |> process([{hd(nums), 1}], 1)
  end

  @doc """
  [5, 3, 4, 8, 6, 7]
  sub problem: d(n-1) include n,
  5 -> 1
  5, 3 -> 1
  5, 3, 4, if a[x] < a[i], j = 0 else, j = 1, max(d[0] + a, d[1] +a)
  5, 3, 4, 8
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
