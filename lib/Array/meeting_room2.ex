defmodule MeetingRoom2 do
  @doc """
  |___|    |___|
    |___|   |_____|

  if start < end, it means there's no meetings end before this new meeting starts
  so, we need room ++

  if start > end, it means there's one meeting finished, so we can resue it's room,
  but when we check the next one, we can't resue the same one, so we need to
  j++
  """
  def run(meetings) do
    {starts, ends} = Enum.reduce(meetings, {[], []}, fn [s,e], {ss, es} ->
      {[s | ss], [e | es]}
    end)

    starts = Enum.sort(starts)
    ends = Enum.sort(ends)
    len = length(meetings)-1

    Enum.reduce(0..len, {0, 0}, fn i, {j, res} ->
      if Enum.at(starts, i) < Enum.at(ends, j), do: {res + 1, j}, else: {res, j+1}
    end)
    |> elem(0)
  end
end
