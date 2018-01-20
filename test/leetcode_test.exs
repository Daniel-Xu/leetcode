defmodule LeetcodeTest do
  use ExUnit.Case

  test "two sum" do
    assert TwoSum.run([3, 2, 4], 6) == [1, 2]
    assert TwoSum.run([2, 7, 11, 15], 9) == [0, 1]
  end
end
