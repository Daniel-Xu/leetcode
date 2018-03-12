defmodule MoveZeros do
  def run(nums) do
    process(nums, 0, 0, length(nums))
  end

  defp process(nums, _fz, cur, n) when cur >= n, do: nums
  defp process(nums, fz, cur, n) do
    case Enum.at(nums, cur, n) do
      0 ->
        process(nums, fz, cur+1, n)
      _ ->
        List.replace_at(nums, cur, 0)
        |> List.replace_at(fz, Enum.at(nums, cur))
        |> process(fz+1, cur+1, n)
    end
  end
end
