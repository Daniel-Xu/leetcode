defmodule SymmetricTree do
  @doc """
  using queue for BFS
  """
  def run(root) do
    :queue.from_list([root, root])
    |> process(false)
  end

  def process(_, true), do: false
  def process({[], []}, _stop), do: true
  def process(q, _stop) do
    {{:value, n1}, q} = :queue.out(q)
    {{:value, n2}, q} = :queue.out(q)

    stop = !(n1.val == n2.val)
    q = if n1.left != nil, do: :queue.in(n1.left, q), else: q
    q = if n2.right != nil, do: :queue.in(n2.right, q), else: q
    q = if n1.right != nil, do: :queue.in(n1.right, q), else: q
    q = if n2.left != nil, do: :queue.in(n2.left, q), else: q

    process(q, stop)
  end
end
