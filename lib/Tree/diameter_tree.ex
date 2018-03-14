defmodule DiameterTree do
  def run(nil), do: 0
  def run(root) do
    left = run(root.left)
    right = run(root.right)
    Enum.max([
      depth(root.left) + depth(root.right),
      left,
      right
    ])
  end

  defp depth(nil), do: 0
  defp depth(root) do
    Enum.max([depth(root.left), depth(root.right)]) + 1
  end
end
