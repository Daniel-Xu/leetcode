defmodule UniqueBst do
  @doc """
  1 2 3

  sub problem:
  1 2
  pick 1 as root
    left d(0) = 1, right d(1) = 1
    1*1 = 1
  pick 2 as root
    left d(1) = 1, right d(0) = 1
    1*1 = 1
  1 + 1 = 2

  current problem
  1 2 3
  pick 1 as root
    left = 0 => d(0)
    right = 2 => d(2) = 2
    1*2 => 2
  pick 2 as root
    left = 1 => d(1)
    right = 1 => d(1)
    1 * 1 = 1

  pick 3 as root
    left = 2 d(2) -> 2
    right = 0 d(0)  -> 1
    2 * 1 = 2
  2 + 1 + 2 = 5
  [1, | 2, 3]

  so
  d(3) = d(0) * d(2)
        + d(1) * d(1)
        + d(2) * d(0)

  if we need get d(3), we need to get d(0), d(1), d(2) first,
  that's why we have the outside Enum.reduce
  """
  def run(0), do: 1
  def run(1), do: 1
  def run(n) do
    # n as root
    Enum.reduce(2..n, %{0 => 1, 1 => 1}, fn(x, m) ->
      m = Map.put_new(m, x, 0)
      Enum.reduce(0..x-1, m, fn(y, m) ->
        Map.update(m, x, 0, &(&1 + Map.get(m, y) * Map.get(m, x - y - 1)))
      end)
    end)
    |> Map.get(n)
  end
end
