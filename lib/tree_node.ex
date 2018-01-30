defmodule TreeNode do
  defstruct(val: 0, left: nil, right: nil)

  def new(v \\ nil, left \\ nil, right \\ nil) do
    %TreeNode{val: v, left: left, right: right}
  end

  @doc """
  mid left right
  """
  def pre_order_traversal(nil), do: []
  def pre_order_traversal(root) do
    [root.val] ++ pre_order_traversal(root.left) ++ pre_order_traversal(root.right)
  end

  @doc """
  left mid right
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

  def add_node(nil, v), do: TreeNode.new(v)
  def add_node(%TreeNode{val: val, left: left, right: right}, v) when v > val,
    do: TreeNode.new(val, left, add_node(right, v))
  def add_node(%TreeNode{val: val, left: left, right: right}, v),
    do: TreeNode.new(val, add_node(left, v), right)

  @doc """
  the order of nums should be the same with queue_traversal
  """
  def build_bst_tree(nums) do
    Enum.reduce(nums, nil, &add_node(&2, &1))
  end

  @doc """
  convert sorted list to binary search tree
  """

  def build_bst_from_sorted_list([]), do: nil
  def build_bst_from_sorted_list(nums) do
    {l, [h | r]} = Enum.split(nums, length(nums) |> div(2))
    TreeNode.new(h, build_bst_from_sorted_list(l), build_bst_from_sorted_list(r))
  end

  @doc """
  construct binary tree from pre_order and inorder traversal
  pre: mid left right [3,9,20,15,7]
  in:  left mid right [9,3,15,20,7]
  """
  def build_tree_from_pre_in_order([], []), do: nil
  def build_tree_from_pre_in_order(pre_order, in_order) do
    root = hd(pre_order)
    i = Enum.find_index(in_order, fn x -> x == root end)
    {l, [h|r]} = Enum.split(in_order, i)
    {p_l, p_r} = Enum.split(tl(pre_order), length(l))
    TreeNode.new(root, build_tree_from_pre_in_order(p_l, l), build_tree_from_pre_in_order(p_r, r))
  end
end
