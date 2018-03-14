defmodule ValidPal2 do
  @doc """
  abca
  ^  ^
  when b != c, we can move Ib (Ib + 1) or move Ic (Ic - 1)
  """

  def run(str) do
    process(str, 0, byte_size(str) - 1)
  end

  defp process(str, l, r) when l < r do
    case String.at(str, l) == String.at(str, r) do
      true -> process(str, l+1, r-1)
      false -> compare(str, l+1, r) || compare(str, l, r-1)
    end
  end
  defp process(str, l, r), do: true

  defp compare(str, l, r) when l < r do
    case String.at(str, l) == String.at(str, r) do
      true -> compare(str, l + 1, r - 1)
      false -> false
    end
  end
  defp compare(_str, _l, _r), do: true
end
