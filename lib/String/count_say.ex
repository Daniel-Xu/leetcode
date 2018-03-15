defmodule CountSay do
  @doc """

  1 1
  2 11
  3 21
  4 1211
  5 111221
  """
  def run(n) do
    process("1", 1, n)
  end

  defp process(pre, i, n) when i == n, do: pre
  defp process(pre, i, n) do
    res = count(pre, nil, 0, "")
    process(res, i+1, n)
  end

  # 1211
  defp count("", h, count, acc), do: acc <> "#{count}" <> h
  defp count(<<h::binary-1, t::binary>>, nil, count, acc), do: count(t, h, 1, acc)
  defp count(<<h::binary-1, t::binary>>, h, count, acc) do
    count(t, h, count+1, acc)
  end
  defp count(<<h::binary-1, t::binary>>, pre, count, acc) do
    count(t, h, 1, acc <> "#{count}" <> pre)
  end
end
