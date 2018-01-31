defmodule SumToLeaf do
  def run(root) do
    dfs_visit(root, 0)
  end

  def dfs_visit(%TreeNode{left: nil, right: nil, val: val}, current), do: current * 10 + val

  def dfs_visit(%TreeNode{left: left, right: right, val: val}, current) do
    Enum.filter([left, right], fn x -> not is_nil(x) end)
    |> Enum.map(&dfs_visit(&1, current * 10 + val))
    |> Enum.sum()
  end
end
