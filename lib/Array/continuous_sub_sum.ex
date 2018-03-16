defmodule ContinuousSubSum do
  @doc """
  keep remainder in the map
  if the same remainder happens again in the map, then it must be n*k

  if remainder is 0, and the i > 1, it should be true, for example
             [0, 6], k = 6
  remainder   0, 0

  """
  def run(nums, k) do
    Enum.with_index(nums)
    |> Enum.reduce_while({0, false, %{}}, fn {x, i}, {sum, _acc, m} ->
      sum = sum + x
      remainder = if k == 0, do: sum, else: rem(sum, k)
      acc = if m[remainder] do
        if i - m[remainder] > 1, do: true, else: false
      else
        false
      end
      acc = if remainder == 0 && i >= 1, do: true, else: acc
      m = Map.put_new(m, remainder, i)

      if acc, do: {:halt, {remainder, true, m}}, else: {:cont, {remainder, false, m}}
    end)
    |> elem(1)
  end
end
