defmodule WordSearch2 do
  @row 4
  @col 4

  def run(l) do
    board = [
      ["o","a","a","n"],
      ["e","t","a","e"],
      ["i","h","k","r"],
      ["i","f","l","v"]
    ]
    s = state(board)
    Enum.filter(l, fn x ->
      do_run(s, x)
    end)
  end

  def do_run(s, str) do
    try do
      for x <- 0..@row-1, y <- 0..@col-1,
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
