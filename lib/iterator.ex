defmodule Iterator do
  defstruct(stack: [])

  def new(root) do
    s = in_stack(root, [])
    %Iterator{stack: s}
  end

  defp in_stack(nil, stack), do: stack
  defp in_stack(root, stack) do
    s = in_stack(root.right, stack)
    s = [root.val | s]
    in_stack(root.left, s)
  end

  def next(%Iterator{stack: []} = i), do: {nil, i}
  def next(%Iterator{stack: [h|t]}) do
    {h, %Iterator{stack: t}}
  end
end
