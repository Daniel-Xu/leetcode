defmodule MedianOfTwoArray do
  require Integer

  def run(l1, l2) do
    sum = length(l1) + length(l2)
    process(l1, l2, div(sum, 2), Integer.is_even(sum), 0, 0)
  end

  def process([], [], _m_i, _even, _i, _v), do: nil
  def process(l1, l2, m_i, even, i, v) when m_i == i do
    extra = least(l1, l2)
    if even == true do
      (extra + v) / 2
    else
      extra
    end
  end

  def process([], [h2 | t2], m_i, odd, i, _v) do
    process([], t2, m_i, odd, i + 1, h2)
  end
  def process([h1 | t1], [], m_i, odd, i, _v) do
    process(t1, [], m_i, odd, i + 1, h1)
  end
  def process([h1 | t1], [h2 | _t2] = l2, m_i, odd, i, _v) when h1 < h2 do
    process(t1, l2, m_i, odd, i + 1, h1)
  end
  def process(l1, [h2 | t2], m_i, odd, i, _v) do
    process(l1, t2, m_i, odd, i+ 1, h2)
  end

  defp least(l1, l2) do
    h1 = List.first(l1)
    h2 = List.first(l2)
    if h1 < h2, do: h1, else: h2
  end
end
