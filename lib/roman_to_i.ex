defmodule RomanToI do
  @roman  %{"M" => 1000,"D" => 500 ,"C" => 100,"L" => 50,"X" => 10,"V" => 5, "I" => 1}

  def run(str), do: process(str, 0)

  def process("", acc), do: acc
  def process(<<a, t::binary>>, acc) when t == "",
    do: Map.get(@roman, <<a>>) + acc
  def process(<<a, a, t::binary>>, acc),
    do: process(<<a>> <> t, Map.get(@roman, <<a>>) + acc)
  def process(<<a, b, t::binary>>, acc) do
    v_a = Map.get(@roman, <<a>>)
    v_b = Map.get(@roman, <<b>>)
    v = if v_a > v_b, do: v_a + acc, else: acc - v_a

    process(<<b>> <> t, v)
  end
end
