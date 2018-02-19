defmodule DecodeWay do
  @code for x <- 1..26, y = <<?A+x-1>>, into: %{}, do: {"#{x}", y}
  @doc """
  sub problem:

  993202837212210

  d(n-1) if decode(0), else: 0
  d(n-2) if decode(10), else: 0
  d(n) = d(n-1) + d(n-2)

  base case:
  d(1) = if decode(x): 1, else: 0
  d(2) = if decode(xx): 1, else: 0
  """
  def run(str) do
    n = byte_size(str)
    process(str, n)
  end

  def process(str, 0), do: 0
  def process(str, n) when n < 0, do: 0
  def process(str, n) do
    Enum.reduce(1..n, %{0 => 1}, fn i, acc ->
      s1 = String.slice(str, i-1..i-1)
      n = if Map.get(@code, s1), do: Map.get(acc, i-1), else: 0
      s2 = String.slice(str, i-2..i-1)
      n = n + if Map.get(@code, s2), do: Map.get(acc, i-2), else: 0
      Map.put(acc, i, n)
    end)
    |> Map.get(n)
  end
end
