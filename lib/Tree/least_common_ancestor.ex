defmodule LeastCommonAncestor do
  def run(root, a, b) do
    lca(root, a, b).val
  end

  @doc """
  For this issue, we have to assume that a, b could be:

  1. both in left subtree
  2. both in right subtree
  3. left and right

  so:
  if they can be found in both left and right, aka: left != nil && right != nil
    -> root

  if they are on the same side, aka: left == nil || right == nil
    -> left || right
  """
  def lca(%TreeNode{val: b} = root, _, b), do: root
  def lca(%TreeNode{val: a} = root, a, _b), do: root
  def lca(%TreeNode{left: nil, right: nil}, _, _), do: nil
  def lca(nil, _, _), do: nil
  def lca(root, a, b) do
    left = lca(root.left, a, b)
    right = lca(root.right, a, b)

    cond do
      left != nil && right != nil -> root
      true -> left || right
    end
  end
end
