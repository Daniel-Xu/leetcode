defmodule AddBinary do
  def run(str1, str2) do
    process(str1, str2, byte_size(str1) - 1 , byte_size(str2) - 1, 0, "")
  end

  defp process(str1, str2, i, j, carry, acc) when i >=0 or j >= 0 do
    carry = if i >= 0 do
      <<a>> = String.at(str1, i)
      carry + a - ?0
    else
      carry
    end

    carry = if j >=0 do
      <<b>> = String.at(str2, j)
      carry + b - ?0
    else
      carry
    end

    process(str1, str2, i-1, j-1, div(carry, 2), acc <> "#{rem(carry, 2)}")
  end

  defp process(_str1, _str2, _i, _j, carry, acc) do
    (if carry != 0, do: acc <> "#{carry}", else: acc)
    |> String.reverse()
  end
end
