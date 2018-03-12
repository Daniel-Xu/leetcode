defmodule Sqrt do
  @doc """
  res * res > num, no way
  (res + 1) * (res + 1) > num => Yes
  else: mid+1, right
  """
  def run(num) do
    process(1, cal_mid(1, num), num, num)
  end

  defp process(left, mid, _right, x) when mid * mid > x do
    process(left, cal_mid(left, mid-1), mid - 1, x)
  end
  defp process(_left, mid, _right, x) when (mid+1) * (mid+1) > x do
    mid
  end
  defp process(_left, mid, right, x) do
    process(mid + 1, cal_mid(mid + 1, right), right, x)
  end

  defp cal_mid(l, r) do
    l + div(r - l, 2)
  end
end
