defmodule Triangle do
  @doc """
  minimum -> optimization
  DP
  [2],
  [3,4],
  [6,5,7],
  [4,1,8,3]

  d[i][j]
  sub problem:
  get sum for each item in the array, and store it in the map

    d[i][j] = Min(d[i-1][j-1], d[i-1][j], d[i-1][j+1]) + V[i][j]

  then just do a Min(map_value)
  """
  def run(triangle) do
    triangle =
      Enum.map(triangle, &Enum.with_index/1)
      |> Enum.with_index()

    len = length(triangle)

    Enum.reduce(triangle, %{}, fn {row, i}, m ->
      Enum.reduce(row, m, fn {v, j}, m ->
        update(i, j, v, m)
      end)
    end)
    |> Enum.filter(fn {{r, _}, v} -> r == len - 1 end)
    |> Enum.map(&elem(&1, 1))
    |> Enum.min()
  end

  def update(0, 0, v, m), do: Map.put(m, {0, 0}, v)

  def update(i, j, v, m) do
    v =
      Enum.min(
        [Map.get(m, {i - 1, j - 1}), Map.get(m, {i - 1, j}), Map.get(m, {i - 1, j + 1})]
        |> Enum.reject(&is_nil/1)
      ) + v

    Map.put(m, {i, j}, v)
  end

  @doc """
  Refactoring tips:
  use O(N) to store the result,
  = read from the bottom of the array
  = replace the result from previous row
  """
end
