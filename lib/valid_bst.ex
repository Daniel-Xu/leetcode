defmodule ValidBST do
  def run(root) do
    try do
      # here -1000 should be a minimum number
      valid?(root, -1000)
    catch
      _ -> false
    end
  end

  @doc """
  how to think about this approach without thinking about the details
  """
  def valid?(nil, _min), do: true
  def valid?(root, min) do
    l_v = valid?(root.left, min)
    if min > root.val, do: throw(false)
    r_v = valid?(root.right, root.val)

    l_v && r_v
  end
end
