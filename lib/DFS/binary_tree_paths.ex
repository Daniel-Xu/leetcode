defmodule BinaryTreePaths do
  def paths(root) do
    process(root, "")
  end

  def process(%TreeNode{left: nil, right: nil} = root, current) do
    current = update_current(root.val, current)
    [current]
  end

  def process(nil, _current), do: []

  def process(root, current) do
    current = update_current(root.val, current)
    acc_left = process(root.left, current)
    acc_right = process(root.right, current)
    acc_left ++ acc_right
  end

  defp update_current(v, ""), do: "#{v}"
  defp update_current(v, current), do: current <> "->#{v}"
end
