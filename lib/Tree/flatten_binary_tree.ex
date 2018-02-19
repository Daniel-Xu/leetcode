defmodule FlattenBinaryTree do
  def run(nil), do: []

  def run(tree) do
    [tree.val] ++ run(tree.left) ++ run(tree.right)
  end
end
