defmodule PathSum2 do
  def run(root, target) do
    dfs_visit(root, [], target)
  end

  def dfs_visit(%TreeNode{left: nil, right: nil, val: v}, acc, target) do
    acc = acc ++ [v]
    if Enum.sum(acc) == target, do: [acc], else: []
  end
  def dfs_visit(nil, _acc, _target), do: []
  def dfs_visit(root, acc, target) do
    res_left = dfs_visit(root.left, acc ++ [root.val], target)
    res_right = dfs_visit(root.right, acc ++ [root.val], target)
    res_left ++ res_right
  end
end
