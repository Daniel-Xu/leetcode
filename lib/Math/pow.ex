defmodule Pow do
  def run(x, 0), do: 1
  def run(x, n) do
    {x, n} = if n < 0, do: {1/x, -n}, else: {x, n}

    if rem(n, 2) == 0 do
      run(x*x, div(n, 2))
    else
      x * run(x*x, div(n, 2))
    end
    |> Float.floor(5)
  end
end
