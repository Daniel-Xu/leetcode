defmodule TreeNode do
  defstruct(val: 0, left: nil, right: nil)

  def new(v, left \\ nil, right \\ nil) do
    %TreeNode{val: v, left: left, right: right}
  end
end
