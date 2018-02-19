defmodule TargetSum do
  def run(nums, target) do
    h = hd(nums)
    Enum.reduce([h, -h], 0, &(dfs_visit(tl(nums), target, &1, 0) + &2))
  end

  @doc """
  return value: number
  """
  def dfs_visit([], target, sum, acc) when sum == target, do: acc + 1
  def dfs_visit([], _target, sum, acc), do: acc
  # this is the original implementation
  # def dfs_visit(start, [h|t], target, sum, acc) do
  #   [-h, h]
  #   |> Enum.map(&dfs_visit(&1, t, target, sum + &1, acc))
  #   |> Enum.sum()
  # end

  def dfs_visit([h | t], target, sum, acc) do
    [-h, h]
    |> Enum.reduce(acc, &(dfs_visit(t, target, sum + &1, acc) + &2))
  end
end
