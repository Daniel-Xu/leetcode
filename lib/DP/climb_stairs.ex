defmodule ClimbStairs do
  @doc """
  DP: n
  sub problem:
  d(n - 1) + d(n - 2)
   1 2 3 4 5 6 7 8 9
  [1 2 3 5]
  """
  def run(n), do: process(1, n, 1, 0)

  def process(_, 1, _, _), do: 1
  def process(_, 2, p, q), do: 2
  def process(n, n, p, q), do: p + q
  def process(x, n, p, q), do: process(x + 1, n, p + q, p)
end
