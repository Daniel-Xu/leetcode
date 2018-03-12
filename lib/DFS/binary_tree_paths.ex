defmodule BinaryTreePaths do
  def paths(root) do
    dfs_visit(root, "")
  end

  # def process(%TreeNode{left: nil, right: nil} = root, current) do
  #   current = update_current(root.val, current)
  #   [current]
  # end

  # def process(nil, _current), do: []

  # def process(root, current) do
  #   current = update_current(root.val, current)
  #   acc_left = process(root.left, current)
  #   acc_right = process(root.right, current)
  #   acc_left ++ acc_right
  # end


  def dfs_visit(%TreeNode{left: nil, right: nil, val: v}, current) do
    [update_current(v, current)]
  end
  def dfs_visit(root, current) do
    Enum.filter([root.left, root.right], fn x -> not is_nil(x) end)
    |> Enum.flat_map(fn x ->
      dfs_visit(x, update_current(root.val, current))
    end)
  end

  defp update_current(v, ""), do: "#{v}"
  defp update_current(v, current), do: current <> "->#{v}"
end
