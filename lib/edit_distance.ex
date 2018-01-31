defmodule EditDistance do
  @doc """
  optimaiztion problem -> DP

  sub problem:

  s1: whas up  => i
  s2: whosls   => j

  if s1(i-1) == s2(j-1)
    d[i][j] = d[i-1][j-1]
  else
    how to think: d[i][j] mean those two strings already match with each other
    delete: d[i][j] = d[i-1][j] + 1
    insert: d[i][j] = d[i][j-1] + 1
    replace: d[i][j] = d[i-1][j-1] + 1

  edge case:
  d[0][j] = j
  d[i][0] = i
  """

  def run("", ""), do: 0
  def run("", s2), do: byte_size(s2)
  def run(s1, ""), do: byte_size(s1)

  def run(s1, s2) do
    i = byte_size(s1)
    j = byte_size(s2)

    m = for x <- 1..i, into: %{{0, 0} => 0}, do: {{x, 0}, x}
    m = for x <- 1..j, into: m, do: {{0, x}, x}

    Enum.reduce(1..i, m, fn i, m ->
      Enum.reduce(1..j, m, fn j, m ->
        v =
          if String.at(s1, i - 1) == String.at(s2, j - 1) do
            Map.get(m, {i - 1, j - 1})
          else
            Enum.min([
              Map.get(m, {i - 1, j}) + 1,
              Map.get(m, {i, j - 1}) + 1,
              Map.get(m, {i - 1, j - 1}) + 1
            ])
          end

        Map.put(m, {i, j}, v)
      end)
    end)
    |> Map.get({i, j})
  end
end
