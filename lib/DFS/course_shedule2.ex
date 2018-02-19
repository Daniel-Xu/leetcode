defmodule CourseSchedule2 do
  @doc """
       1 -> 3
     /    /
  0  --> 2

  This are two different type of DFS
  -> 1. use the acc from previous branches
  -> 2. each branch is calculated separately and then we combine the result together
  """
  def run(4, nums) do
    s = state(nums)
    try do
      # Enum.reduce(s, [], fn {x, deps}, acc ->
        # res = check(s, x, x, [x], [])
      res = check(s, 0, 0, [])
      [0 | res]
      #   if length(res) > length(acc), do: res, else: acc
      # end)
    catch
      _ -> []
    end
  end

  @doc """
  iex(19)> CourseSchedule2.state([[1,0],[2,0],[3,1],[3,2]])
  %{1 => [0], 2 => [0], 3 => [2, 1]}
  """
  def state(nums) do
    Enum.reduce(nums, %{}, fn [x, y], acc ->
      Map.update(acc, y, [x], &[x | &1])
    end)
  end

  @doc """
  []: has cycle
  deps list: no cycle

  state:
  %{0 => [2, 1], 1 => [3], 2 => [3]}


  false: has no cycle
  topologcial sorting
  """
  def check(state, start, target, acc) do
    deps = Map.get(state, start, [])
    acc = if start != target && not (start in acc),
      do: [start | acc],
      else: acc
    acc = if deps == [], do: Enum.reverse(acc), else: acc

    # notice that here we pass acc to the Enum.reduce, this will
    # make sure that the result from previous branches can be used
    # in new branches
    Enum.reduce(deps, acc, fn x, res ->
      if x in acc, do: acc, else: check(state, x, target, res)
    end)
  end
end
