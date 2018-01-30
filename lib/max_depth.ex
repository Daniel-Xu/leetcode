defmodule MaxDepth do
  def run(tree) do
    dfs_visit(tree, 0)
  end

  def dfs_visit(%TreeNode{left: nil, right: nil}, depth), do: depth + 1
  def dfs_visit(root, depth) do
    [root.left, root.right]
    |> Enum.filter(fn x -> not is_nil(x) end)
    |> Enum.reduce(0, fn(x, max) ->
      res = dfs_visit(x, depth + 1)
      if max > res, do: max, else: res
    end)
  end
end
