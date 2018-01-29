defmodule TreeNode do
  defstruct(val: 0, left: nil, right: nil)

  def new(v, left \\ nil, right \\ nil) do
    %TreeNode{val: v, left: left, right: right}
  end

  @doc """
  left mid right
  """
  def pre_order_traversal(nil), do: []
  def pre_order_traversal(root) do
    [root.val] ++ pre_order_traversal(root.left) ++ pre_order_traversal(root.right)
  end

  @doc """
  mid left right
  """
  def in_order_traversal(nil), do: []
  def in_order_traversal(root) do
    in_order_traversal(root.left) ++ [root.val] ++ in_order_traversal(root.right)
  end

  def post_order_traversal(nil), do: []
  def post_order_traversal(root) do
    post_order_traversal(root.left) ++ post_order_traversal(root.right) ++ [root.val]
  end

  def queue_traversal(root), do: do_queue_traversal([root], [])
  def do_queue_traversal([], acc), do: acc
  def do_queue_traversal([%TreeNode{left: l, right: r, val: v} | t], acc) do
    children = Enum.filter([l, r], fn(x) -> not is_nil(x) end)
    do_queue_traversal(t ++ children, acc ++ [v])
  end

  def height(nil), do: 0
  def height(root) do
    Enum.max([height(root.left), height(root.right)]) + 1
  end
end
