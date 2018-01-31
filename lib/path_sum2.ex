defmodule PathSum2 do
  def run(root, target) do
    dfs_visit(root, [], target)
  end

  def dfs_visit(%TreeNode{left: nil, right: nil, val: v}, acc, target) do
    acc = acc ++ [v]
    if target == Enum.sum(acc), do: [acc], else: []
  end

  def dfs_visit(root, acc, target) do
    Enum.filter([root.left, root.right], fn x -> not is_nil(x) end)
    |> Enum.reduce([], fn x, res ->
      res ++ dfs_visit(x, acc ++ [root.val], target)
    end)
  end
end
