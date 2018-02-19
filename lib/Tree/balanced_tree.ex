defmodule BalancedTree do
  def balance?(nil), do: true

  def balance?(root) do
    balance?(root.right) && balance?(root.left) &&
      abs(TreeNode.height(root.left) - TreeNode.height(root.right)) <= 1
  end
end
