defmodule FindNeighbour do
  def run(l, start) do
    Matrix.from_list(l)
    |> dfs_visit(start, MapSet.new(), [])
  end

  def dfs_visit(m, {x, y} = start, visited, acc) do
    visited = MapSet.put(visited, start)
    connected_cors = connected(m, start, visited, m[x][y])
    if connected_cors == [] do
      acc
    else
      Enum.flat_map(connected_cors, fn node ->
        dfs_visit(m, node, visited, [node | acc])
      end)
    end
  end

  def connected(m, {x, y}, visited, v) do
    [{x-1, y}, {x+1, y}, {x, y-1}, {x, y+1}]
    |> Enum.filter(fn {i, j} ->
      m[i] && m[i][j] == v && (not MapSet.member?(visited, {i, j}))
    end)
  end
end
