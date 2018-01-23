defmodule PerfectSquare do
  @doc """
  least
  optimization: DP
  1, 4, 9, 16

  sub problem:
  d(11)
    min from
    -> d(11 - 9) + 1   #here 1 is refering to the 9
    -> d(11 - 4) + 1
    -> d(11 - 1*1) + 1

  d(0) -> 0
  d(1) -> 1
  d(2) -> d(1) + 1 = 2
  d(3) -> d(3 -1 ) + 1 = 3
  d(4) ->
    d(4 -4 ) + 1 = 1
    d(4 -2 ) + 1 = 3
    d(4 -1 ) + 1 = 3
  """

  def run(0), do: 0
  def run(1), do: 1
  def run(n) do
    Enum.reduce(2..n, %{0 => 0, 1 => 1}, fn(i, m) ->
      min =
        Enum.take_while(1..i, &(&1 * &1 <= i))
        |> Enum.reduce(i, fn(x, acc) ->
          min = Map.get(m, i - x * x) + 1
          if min < acc, do: min, else: acc
        end)
      Map.put(m, i, min)
    end)
    |> Map.get(n)
  end
end
