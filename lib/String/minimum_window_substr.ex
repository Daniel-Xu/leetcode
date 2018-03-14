defmodule MiniWindowSubstr do
  @doc """
  ADOBECODEBANC
  ACB

  the basic concept is:
  1. find a substr, record it
  2. shrink the substr
  -> record it if it's still valid
  -> if it's not valid anymore, expand the substr again

  to shrink the substr, move the pre pointer
  to expand the substr, move the post pointer

  counter: the length of target to determine if the substr is valid
  hashmap: the number of occurence of each character in target string
  to decide when to modify counter
  """

  def run(str, target) do
    cnt = String.graphemes(target)
    |> Enum.reduce(%{}, fn x, m ->
      Map.update(m, x, 1, &(&1+1))
    end)

    process(str, target, byte_size(target), cnt, 0, 0, 0, byte_size(str) + 1)
  end

  defp process(str, target, counter, m, pre, post, head, min) when post < byte_size(str) do
    cur_c = String.at(str, post)
    counter = if m[cur_c] && m[cur_c] > 0, do: counter - 1, else: counter
    post = post + 1 # here is for calculating min in the shrink_window function
    m = Map.update(m, cur_c, -1, &(&1 - 1))
    {counter, pre, m, head, min} = shrink_window(str, counter, pre, post, m, head, min)
    process(str, target, counter, m, pre, post, head, min)
  end
  defp process(str, _target, _counter, _m, _pre, _post, head, min) do
    String.slice(str, head..head+min-1)
  end

  # everytime you want to move the pre pointer, you need to update the related counter
  # in this function, post pointer is not moved
  defp shrink_window(str, counter, pre, post, m, head, min) when counter == 0 do
    {head, min} = if post - pre < min, do: {pre, post - pre}, else: {head, min}
    cur_c = String.at(str, pre)
    m = Map.update!(m, cur_c, &(&1 + 1))
    counter = if m[cur_c] && m[cur_c] > 0, do: counter + 1, else: counter
    shrink_window(str, counter, pre+1, post, m, head, min)
  end
  defp shrink_window(_str, counter, pre, _post, m, head, min), do: {counter, pre, m, head, min}
end
