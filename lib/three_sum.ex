defmodule ThreeSum do
  def run(nums) do
    Enum.sort(nums)
    |> permu()
    |> Enum.uniq()
    |> Enum.filter(fn(x) ->
      Enum.sum(x) == 0
    end)
  end

  def permu(n, acc \\ [])
  def permu([], acc), do: acc
  def permu([h | t], acc) do
    new_c = (for x <- combine(t), do: [h | x])
    permu(t, new_c ++ acc)
  end

  def combine(n, acc \\ [])
  def combine([], acc), do: acc
  def combine([h | t], acc) do
    new_c = (for x <- t, do: [h, x])
    combine(t, new_c ++ acc)
  end
end
