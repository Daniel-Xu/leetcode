defmodule ValidParen do
  def run(str) do
    process(str, [], false)
  end

  @doc """
  ()[]{} true
  (] false
  """
  def process(_str, _left, true), do: false
  def process("", left, stop), do: true

  def process(<<h, t::binary>>, left, stop) when h in [?(, ?[, ?{] do
    process(t, [h | left], stop)
  end

  def process(<<h, t::binary>> = str, left, stop) do
    if p_match?(List.first(left), h) do
      [l_h | l_t] = left
      process(t, l_t, stop)
    else
      process(str, left, true)
    end
  end

  def p_match?(?(, ?)), do: true
  def p_match?(?[, ?]), do: true
  def p_match?(?{, ?}), do: true
  def p_match?(_, _), do: false
end
