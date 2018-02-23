defmodule QuickSort do
  def quick_sort([]), do: []
  def quick_sort([pivot | t]) do
    quick_sort(for x <- t, x < pivot, do: x)
    ++ [pivot]
    ++ quick_sort(for x <- t, x >= pivot, do: x)
  end
end
