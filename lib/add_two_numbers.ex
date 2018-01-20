defmodule AddTwoNumbers do
  def run(l1, l2) do
    process(l1, l2, 0, [])
  end

  def process([], [], 0, acc), do: Enum.reverse(acc)
  def process([], [], 1, acc), do: Enum.reverse([1 | acc])
  def process([], [h2 | t2], extra, acc) do
    sum = h2 + extra
    extra = div(sum, 10)
    sum = rem(sum, 10)
    process([], t2, extra, [sum | acc])
  end
  def process([h1 | t1], [], extra, acc) do
    sum = h1 + extra
    extra = div(sum, 10)
    sum = rem(sum, 10)
    process(t1, [], extra, [sum | acc])
  end
  def process([h1 | t1], [h2 | t2], extra, acc) do
    sum = h1 + h2 + extra
    extra = div(sum, 10)
    sum = rem(sum, 10)
    process(t1, t2, extra, [sum | acc])
  end
end
