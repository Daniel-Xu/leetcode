defmodule LevelOrder do
  @doc """
  we need a size to help us keep tracking of each level
  """
  def run(nil), do: []
  def run(root) do
    process(:queue.from_list([root]), 1, [])
  end

  defp process({[], []}, size, acc), do: acc
  defp process(q, size, acc) do
    {level_val, q} = level(q, size, [])
    process(q, :queue.len(q), acc ++ [level_val])
  end

  defp level(q, size, acc) when size > 0 do
    {{:value, node}, q} = :queue.out(q)
    q = if node.left, do: :queue.in(node.left, q), else: q
    q = if node.right, do: :queue.in(node.right, q), else: q

    level(q, size-1, acc ++ [node.val])
  end

  defp level(q, size, acc), do: {acc, q}
end
