defmodule SummaryRange do

  def run([]), do: []
  def run(nums) do
    process(nums, nil, "", [])
  end

  def process([], start, cur, acc),
    do: if cur == "#{start}", do: acc ++ [cur], else: acc ++ [cur <> "->" <> "#{start}"]
  def process([h | t], nil, _cur, acc), do: process(t, h, "#{h}", acc)
  def process([h | t], start, cur, acc) do
    if start + 1 == h,
      do: process(t, h, cur, acc),
      else: process(t, h, "#{h}", acc ++ [cur <> "->" <> "#{start}"])
  end
end
