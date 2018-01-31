defmodule GroupAnagrams do
  def run(strs) do
    process(strs, MapSet.new(), []) |> Enum.sort()
  end

  @doc """
  ["eat", "tea", "tan", "ate", "nat", "bat"]
  eat
  """
  def process([], _m, acc), do: acc

  def process([h | t], m, acc) do
    if MapSet.member?(m, h) do
      process(t, m, acc)
    else
      {m, g} =
        Enum.reduce(t, {m, [h]}, fn s, {m, g} ->
          if anagrams?(h, s), do: {MapSet.put(m, s), [s | g]}, else: {m, g}
        end)

      acc = if g == [], do: acc, else: [g | acc]
      process(t, m, acc)
    end
  end

  def anagrams?(str1, str2) when byte_size(str1) != byte_size(str2), do: false

  def anagrams?(str1, str2) do
    String.split(str1, "") |> Enum.sort() == String.split(str2, "") |> Enum.sort()
  end
end
