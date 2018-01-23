defmodule UniquePath do
  def run(m, n) when m == 1 or n == 1, do: 1
  def run(m, n) do
    s = for x <- 1..m, y = 1, into: %{}, do: {{x, y}, 1}
    s = for y <- 1..n, x = 1, into: s, do: {{x, y}, 1}

    Enum.reduce(2..m, s, fn(x, s) ->
      Enum.reduce(2..n, s, fn(y, s) ->
        Map.put(s, {x, y}, Map.get(s, {x-1, y}) + Map.get(s, {x, y-1}))
      end)
    end)
    |> Map.get({m, n})
  end
end
