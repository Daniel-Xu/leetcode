defmodule ValidCal2 do
  def run(str) do
    do_run(str, {0, ?+}, [])
  end

  @doc """
  2 + 2 * 3 + 4

  num = 2
  last_sign +
  + => last_sign == "+", stack.push(+2), last_sign = "+"

  num = 2
  * =>  last_sign == "+", stack.push(+2), last_sign = "*"

  num = 3
  + => last_sign == "*", stack.pop() * num |> stack.push(), last_sing = +
  num= 4
  <<>> => last == "+", stach.push(num)

  we need a last sign to save the current sign
  and then keep moving with the string, when we
  get the new sign, we can check the last sign again
  in this case, we have both left and right operand of our operator
  """
  def do_run(<<>>, {num, sign}, stack) when sign in [?+, ?-],
    do: Enum.sum([value_with_sign(num, sign)| stack])
  def do_run(<<>>, {num, sign}, [h_v | t]) when sign in [?*, ?/],
    do: Enum.sum([new_value(h_v, num, sign)| t])

  def do_run(<<" ", t::binary>>, res, stack),
    do: do_run(t, res, stack)
  def do_run(<<x, t::binary>>, {num, sign}, stack) when x in [?*, ?/, ?+, ?-] and sign in [?+, ?-] do
    do_run(t, {0, x}, [value_with_sign(num, sign) | stack])
  end
  def do_run(<<x, t::binary>>, {num, sign}, [h_v|t_v]) when x in [?*, ?/, ?+, ?-] and sign in [?*, ?/] do
    do_run(t, {0, x}, [new_value(h_v, num, sign) | t_v])
  end

  def do_run(<<x, t::binary>>, {num, sign}, stack) do
    do_run(t, {10*num + x-?0, sign}, stack)
  end

  defp value_with_sign(num, ?+), do: num
  defp value_with_sign(num, ?-), do: -num
  defp new_value(a, b, ?/), do: div(a, b)
  defp new_value(a, b, ?*), do: a * b
end
