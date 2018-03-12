defmodule ValidPal do
  def run(""), do: true
  def run(str) do
    str =
      String.replace(str, ~r/[^\w]/, "")
      |> String.downcase()
    String.reverse(str) == str
  end
end
