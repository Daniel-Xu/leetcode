defmodule StrStr do
  def run(s1, s2) do
    process(s1, s2, false, 0)
  end

  @doc """
  aabc abc
  """
  def process(s1, s2, _, _) when byte_size(s1) < byte_size(s2), do: -1
  def process(_, _, true, index), do: index

  def process(<<h, t::binary>> = s1, s2, stop, index) do
    res = s_index(s1, s2, index)

    if res != -1 do
      process(s1, s2, true, res)
    else
      process(t, s2, stop, index + 1)
    end
  end

  def s_index(s1, s2, i) when byte_size(s1) < byte_size(s2), do: -1
  def s_index(_, "", i), do: i

  def s_index(<<h1, t1::binary>>, <<h1, t2::binary>>, i) do
    s_index(t1, t2, i)
  end

  def s_index(_, _, _), do: -1
end
