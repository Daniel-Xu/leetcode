defmodule SortColor do
  @doc """
  [1, 0, 1, 2, 2]
  =>
  [0, 1, 1, 2, 2]

  this process is like quick sort

  if we can use pointer, we can have three pointers:

  1. small (this pointer is used to keep the index of first 1)
  2. current (this pointer is used to traverse the nums)
  3. big (this point is used to keep the big position)

  when the current value is 0, we can be sure that:
  everything before current index is 0 or 1, and small keep the index of first 1
  ->
    swap_v(cur, small)
    small++
    cur++

  when current value == 1
  ->
    cur++

  when current value == 2
  because we don't don't what's the value of v[big], so we can't move cur index
  ->
    swap_v(cur, big)
    big--
  """
  def run([]), do: []
  # def run(nums) do
  #   (for x <- nums, x == 0, do: x) ++
  #   (for x <- nums, x == 1, do: x) ++
  #   (for x <- nums, x == 2, do: x)
  # end

  def run(nums) do
    process(nums, 0, 0, length(nums) - 1)
  end

  defp process(nums, _small, cur, big) when cur > big, do: nums
  defp process(nums, small, cur, big) do
    case Enum.at(nums, cur) do
      0 ->
        List.replace_at(nums, small, 0)
        |> List.replace_at(cur, Enum.at(nums, small)) # we can replace with value 1 here
        |> process(small+1, cur+1, big)
      1 ->
        process(nums, small, cur+1, big)
      2->
        List.replace_at(nums, big, 2)
        |> List.replace_at(cur, Enum.at(nums, big))
        |> process(small, cur, big-1)
    end
  end
end
