defmodule MeetingRoom do
  @doc """
  determine if a person could attend all meetings
  [[0, 30], [5, 10], [15, 20]]

  """
  def run(intervals) do
    Enum.sort_by(intervals, fn [s, _e] -> s end)
    |> process()
  end

  defp process([_ | []]), do: true
  defp process([[s1, e1], [s2, e2] | t]) do
    if s2 < e1, do: false, else: process([[s2, e2] | t])
  end
end
