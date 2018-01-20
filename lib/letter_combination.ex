defmodule LetterCombination do
  @p %{"2" => ["a", "b", "c"], "3" => ["d", "e", "f"],
       "4" => ["g", "h", "i"], "5" => ["j", "k", "l"],
       "6" => ["m", "n", "o"], "7" => ["p", "q", "r", "s"],
       "8" => ["t", "u", "v"], "9" => ["w", "x", "y", "z"]}

  @doc """
  234 =>
  ["adg","adh","adi","aeg","aeh","aei","afg","afh","afi","bdg","bdh","bdi","beg","beh","bei","bfg","bfh","bfi","cdg","cdh","cdi","ceg","ceh","cei","cfg","cfh","cfi"]
  """
  def run(str) do
    process(str)
  end

  @doc """
  for x <- process(t), h <> x
  """
  def process(""), do: [""]
  def process(<<h::binary-1, t::binary>>) do
    for x <- Map.get(@p, h), y <- process(t), do: x <> y
  end
end
