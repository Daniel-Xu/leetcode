defmodule GenerateParen do
  def run(n) do
    process(n, 0, 0, "", MapSet.new())
    |> Enum.into([])
    |> Enum.sort()
  end

  @doc """
  depth: 0
  (
  depth: 1
  ({(|)}

  root -> ( possible -> [(, )]
  ((  2 0
  ()  1 1
  ((() 3 1
  """
  def process(n, n, n, acc, m), do: MapSet.put(m, acc)

  def process(n, l, r, acc, m) do
    possible(n, l, r)
    |> Enum.reduce(m, fn b, m ->
      {l, r} = if b == "(", do: {l + 1, r}, else: {l, r + 1}
      process(n, l, r, acc <> b, m)
    end)
  end

  def possible(n, n, n), do: []
  def possible(n, n, _r), do: [")"]
  def possible(_n, l, r) when l >= r, do: ["(", ")"]
  def possible(_n, _l, _r), do: []
end
