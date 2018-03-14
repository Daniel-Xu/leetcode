defmodule NumberOfIsland do
  @doc """
  typical DFS

  we traverse each node, and do a dfs if it's not visited and its value is 1
  """
  def run(matrix) do
    grid = Matrix.from_list(matrix)
    rows = map_size(grid)
    cols = map_size(grid[0])

    Enum.reduce(0..rows-1, {MapSet.new(), 0}, fn r, {m, acc} ->
      Enum.reduce(0..cols-1, {m, acc}, fn c, {m, acc} ->
        if grid[r][c] == 1 && !MapSet.member?(m, {r, c}) do
          {process(grid, {r, c}, m), acc+1}
        else
          {m, acc}
        end
      end)
    end)
    |> elem(1)
  end

  defp process(grid, start, visited) do
    visited = MapSet.put(visited, start)

    connected(grid, start, visited)
    |> Enum.reduce(visited, fn x, m ->
      if MapSet.member?(m, x),
        do: m,
        else: process(grid, x, m)
    end)
  end

  defp connected(grid, {x, y}, visited) do
    [{x-1, y}, {x+1, y}, {x, y-1}, {x, y+1}]
    |> Enum.filter(fn {a, b} ->
      !MapSet.member?(visited, {a, b}) &&
      a >=0 && a < map_size(grid) && b >=0 && b < map_size(grid[0]) && grid[a][b] == 1
    end)
  end
end
