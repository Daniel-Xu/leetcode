defmodule OneEditDistance do
  def run(str1, str2) when abs(byte_size(str1) - byte_size(str2)) >= 2, do: false
  def run(<<h, t1::binary>>, <<h, t2::binary>>) do
    run(t1, t2)
  end
  def run(<<h1, t1::binary>> = str1, <<h2, t2::binary>> = str2) when byte_size(str1) == byte_size(str2) do
    t1 == t2
  end
  def run(<<h1, t1::binary>> = str1, <<h2, t2::binary>> = str2) when byte_size(str1) > byte_size(str2) do
    t1 == str2
  end
  def run(<<h1, t1::binary>> = str1, <<h2, t2::binary>> = str2) do
    str1 == t2
  end
end
