defmodule LongestPalStr do
  @doc """
  babad

  sub problem:
  babad
  j  i

  p(0, 0) -> true
  state function:
  p(0, 1) ->
    s0 == s1 ->  true
    _ -> false
  p(1, 1) -> true

  p(2, 0) -> si == sj && i - j >=2 -> p(2-1, 0+1) = p(1,1)

  p(i, j) =
    if si==sj
      P(i + 1, j-1)
    else
      false

  p(0, 0) = true
  """

  def run(str) when byte_size(str) <= 2, do: str
  def run(str) do
    n = byte_size(str)
    {_, {s, e, _}} =
      Enum.reduce(0..n-1, {%{{0, 0} => true}, {0, 0, 0}}, fn(i, acc) ->
        Enum.reduce(0..i, acc, fn(j, {m, {_s, _e, max} = s_state} = acc) ->
          if String.at(str, i) == String.at(str, j) and (i - j < 2 or Map.get(m, {j+1, i-1}, false)) do
            s_state = if i - j > max, do: {j, i, i - j}, else: s_state
            {Map.put(m, {j, i}, true), s_state}
          else
            acc
          end
        end)
      end)
    String.slice(str, s..e)
  end
end
