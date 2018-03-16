defmodule MergeKList do
  @doc """
  just merge two list
  then put the result back to the beigining of the new list
  """

  def run([]), do: []
  def run([res | []]), do: res
  def run([l1, l2 | t]) do
    res = merge_two(l1, l2, [])
    run([res | t])
  end

  def merge_two([], [], acc), do: Enum.reverse(acc)
  def merge_two([h1 | t1], [], acc) do
    merge_two(t1, [], [h1 | acc])
  end
  def merge_two([], [h2 | t2], acc) do
    merge_two([], t2, [h2 | acc])
  end
  def merge_two([h1 | t1], [h2 | t2] = l2, acc) when h1 <= h2 do
    merge_two(t1, l2, [h1 | acc])
  end
  def merge_two([h1 | t1] = l1, [h2 | t2], acc) do
    merge_two(l1, t2, [h2 | acc])
  end
end
