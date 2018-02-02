defmodule ValidCal do
  def run(str) do
    do_run(str, {0, 0, 1}, [])
  end

  @doc """
  (1+(4+15+2)-3)+(6+8))
  1 + 1

  this one we need to save previous acc and previous sign, also the current num

  once we encounter (, we will save the previous res and sign in stack,
  and when it comes to ), we add the previsous res and the current one
  """

  def do_run(<<>>, {res, num, sign}, _stack), do: res + sign * num
  def do_run(<<" ", t::binary>>, res, stack),
    do: do_run(t, res, stack)
  def do_run(<<"(", t::binary>>, {res, _num, sign}, stack) do
    do_run(t, {0, 0, 1}, [sign, res]++stack)
  end
  def do_run(<<"+", t::binary>>, {res, num, sign}, stack) do
    do_run(t, {res + sign*num, 0, 1}, stack)
  end
  def do_run(<<"-", t::binary>>, {res, num, sign}, stack) do
    do_run(t, {res + sign * num, 0, -1}, stack)
  end
  def do_run(<<")", t::binary>>, {res, num, sign}, [p_sign, p_res | tail]) do
    do_run(t, {p_res + p_sign * (res + num * sign), 0, 1}, tail)
  end
  def do_run(<<n, t::binary>>, {res, num, sign}, stack) do
    num = num * 10 + n-?0
    do_run(t, {res, num, sign}, stack)
  end
end
