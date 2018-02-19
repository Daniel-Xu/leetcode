defmodule Matrix do
  def from_list(list) when is_list(list) do
    do_from_list(list)
  end

  defp do_from_list(list, map \\ %{}, index \\ 0)
  defp do_from_list([], map, _index), do: map
  defp do_from_list([h|t], map, index) do
    map = Map.put(map, index, do_from_list(h))
    do_from_list(t, map, index + 1)
  end
  defp do_from_list(other, _, _), do: other
end

defmodule WordSearch do
  @row 3
  @col 4
  def run(str) do
    board = [
      ["A","B","C","E"],
      ["S","F","C","S"],
      ["A","D","E","E"]
    ]

    s = state(board)

    try do
      for x <- 0..2, y <- 0..3,
        do: process(s, MapSet.new(), {x, y}, "", str)
    catch
     _ -> true
    else
      v -> false
    end
  end

  def state(board) do
    board
    |> Matrix.from_list()
  end

  def process(s, m, {i, j}, acc, target) do
    m = MapSet.put(m, {i, j})
    connected = connected(i, j, m)
    if connected == [] do
      acc = acc <> s[i][j]
      if acc == target, do: throw(true)
      [acc]
    else
      Enum.reduce(connected, [], fn {x, y}, res ->
        acc = acc <> s[i][j]
        if acc == target, do: throw(true)
        r = process(s, m, {x, y}, acc, target)
        res ++ r
      end)
    end
  end

  def connected(i, j, m) do
    [{i+1, j}, {i-1, j}, {i, j+1}, {i, j-1}]
    |> Enum.filter(fn {i, j} ->
      i < @row and i >= 0 and j < @col and j >= 0
      and (not MapSet.member?(m, {i, j}))
    end)
  end
end
