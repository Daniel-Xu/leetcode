defmodule CourseSchedule do
  def run(n, deps) do
    # %{0 => 1, 1 => 2}
    s =
      Enum.reduce(deps, %{}, fn [x, y], acc ->
        Map.put(acc, x, y)
      end)

    Enum.reduce_while(s, false, fn {n, _v}, acc ->
      if check(s, n, n) == true, do: {:halt, false}, else: {:cont, true}
    end)
  end

  @doc """
  return true/false
  true: has cycle
  """
  def check(s, current, target) do
    case Map.get(s, current) do
      nil -> false
      ^target -> true
      n -> check(s, n, target)
    end
  end
end
