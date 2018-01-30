defmodule PathSum1 do
  def run(root, target) do
    dfs_visit(root, [], target)
  end

  def dfs_visit(%TreeNode{left: nil, right: nil, val: v}, current, target),
    do: Enum.sum([v | current]) == target
  def dfs_visit(root, current, target) do
    [root.left, root.right]
    |> Enum.filter(fn x -> not is_nil(x) end)
    |> Enum.reduce_while(false, fn(x, _res) ->
      res = dfs_visit(x, [x.val | current], target)
      if res == true, do: {:halt, true}, else: {:cont, false}
    end)
  end
end
