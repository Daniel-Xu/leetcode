defmodule ExcelCol do
  def run(n) do
    process(n, "")
  end

  @doc """
  Think of turning 1010101 into string
  the only difference is we use 26 instead of 10
  """
  def process(n, acc) when n == 0, do: acc
  def process(n, acc) do
    process(div(n, 26), <<?A + rem(n, 26) - 1>> <> acc)
  end
end
