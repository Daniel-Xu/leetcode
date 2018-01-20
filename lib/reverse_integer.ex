defmodule ReverseInteger do
  def run(n) do
    process(n, 0)
  end

  def process(0, acc), do: acc
  def process(n, acc) do
    process(div(n, 10), rem(n, 10) + acc * 10)
  end
end
