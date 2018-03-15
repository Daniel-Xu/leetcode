defmodule EnglishToWords do
  @tens Matrix.from_list(["", "Ten", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety"])
  @ths Matrix.from_list(["", "Thousand", "Million", "Billion"])
  @less_20 Matrix.from_list(["", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen"])

  @doc """

  12345
  345 =>
  """
  def run(0), do: "zero"
  def run(num) do
    divided_by_1000(num, 0, "")
  end

  # 123456  345
  # because english words are sperated by 1000
  # like thousands, million, billion
  # 10 000
  defp divided_by_1000(num, i, acc) when num > 0 do
    acc = if rem(num, 1000) != 0,
      do: inside_1000(rem(num, 1000)) <> @ths[i] <> " " <> acc,
      else: acc
    divided_by_1000(div(num, 1000), i + 1, acc)
  end
  defp divided_by_1000(_num, _i, acc), do: String.trim(acc)

  # 325
  # 25
  # 1 - 20
  # 0
  defp inside_1000(num) do
    cond do
      num == 0 -> ""
      num < 20 -> @less_20[num] <> " "
      num < 100 -> @tens[div(num, 10)] <> " " <> inside_1000(rem(num, 10))
      true -> @less_20[div(num, 100)] <> " Hundred " <> inside_1000(rem(num,  100))
    end
  end
end
