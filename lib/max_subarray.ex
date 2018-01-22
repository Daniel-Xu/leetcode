defmodule MaxSubarray do
  def run(nums) do
    tl(nums)
    |> process(hd(nums), 0, hd(nums))
  end

  @doc """
  -2 -1 -3 4 -1 2 1 -5 4
  -2 -1 -3 4  3 5 6  1 5
  """
  def process([], max, _i, _pre), do: max
  def process([h | t], max, i, pre) do
    pre = if pre > 0, do: pre + h, else: h
    process(t, Enum.max([pre, max]), i + 1, pre)
  end
end
