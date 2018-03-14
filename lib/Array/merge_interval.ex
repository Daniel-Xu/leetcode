defmodule MergeInterval do

  @doc """
  Given [1,3],[2,6],[8,10],[15,18],
  return [1,6],[8,10],[15,18].

  """
  def run(intervals) do
    Enum.sort_by(intervals, fn [a, b] -> a end)
    |> process([])
  end

  def process([res | []], acc), do: acc ++ [res]
  def process([[a1, b1], [a2, b2] | t], acc) when a2 <= b1 do
    if b2 <= b1 do
      process([[a1, b1] | t], acc)
    else
      process([[a1, b2] | t], acc)
    end
  end
  def process([[a1, b1], [a2, b2] | t], acc) do
    process([[a2, b2] | t], acc ++ [[a1, b1]])
  end
end
