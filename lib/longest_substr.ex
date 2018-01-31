defmodule LongestSubstr do
  def run(str) do
    process(str, "") |> byte_size()
  end

  def process("", sub_str), do: sub_str
  def process(str, sub_str) when byte_size(str) <= byte_size(sub_str), do: sub_str

  def process(<<_::binary-1, t::binary>> = str, sub_str) do
    new_sub_str = longest_sub_str(str)

    if byte_size(sub_str) > byte_size(new_sub_str),
      do: process(t, sub_str),
      else: process(t, new_sub_str)
  end

  def longest_sub_str(str, stop \\ false, acc \\ "")
  def longest_sub_str(_str, true, acc), do: acc
  def longest_sub_str("", false, acc), do: acc

  def longest_sub_str(<<h::binary-1, t::binary>> = str, stop, acc) do
    if String.contains?(acc, h),
      do: longest_sub_str(str, true, acc),
      else: longest_sub_str(t, stop, acc <> h)
  end
end
