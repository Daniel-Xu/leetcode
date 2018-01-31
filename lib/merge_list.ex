defmodule MergeList do
  def run(l1, l2) do
    process(l1, l2, [])
  end

  def process([], [], acc), do: Enum.reverse(acc)
  def process([h1 | t1], [], acc), do: process(t1, [], [h1 | acc])
  def process([], [h2 | t2], acc), do: process([], t2, [h2 | acc])

  def process([h1 | t1], [h2 | t2], acc) when h1 < h2 do
    process(t1, t2, [h2 | [h1 | acc]])
  end

  def process([h1 | t1], [h2 | t2], acc) do
    process(t1, t2, [h1 | [h2 | acc]])
  end
end
