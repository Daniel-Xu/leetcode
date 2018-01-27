defmodule CourseSchedule do
  def run(n, deps) do
    # %{0 => [1], 1 => [2, 0]}
    s = Enum.reduce(deps, %{}, fn([x | y], acc) ->
      Map.update(acc, x, List.wrap(y), &(&1 ++ y))
    end)

    Enum.reduce_while(s, false, fn({n, _v}, acc) ->
      if check(s, n, n) == true, do: {:halt, false}, else: {:cont, true}
    end)
  end

  @doc """
  return true/false
  true: has cycle

  # %{0 => [1], 1 => [2, 0]}
  """
  def check(s, current, target) do
    Map.get(s, current, [])
    |> Enum.reduce_while(false, fn(n, _acc) ->
      if n == target,
        do: {:halt, true},
        else: {:cont, check(s, n, target)}
    end)
  end
end
