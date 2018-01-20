defmodule LeetcodeTest do
  use ExUnit.Case

  test "two sum" do
    assert TwoSum.run([3, 2, 4], 6) == [1, 2]
    assert TwoSum.run([2, 7, 11, 15], 9) == [0, 1]
  end

  test "add two number" do
    assert AddTwoNumbers.run([2,4,3], [5,6,4]) == [7,0,8]
    assert AddTwoNumbers.run([], [0, 1]) == [0, 1]
    assert AddTwoNumbers.run([9, 9], [1]) == [0, 0, 1]
  end

  test "longest sub str" do
    assert LongestSubstr.longest_sub_str("pwwkew") == "pw"
    assert LongestSubstr.longest_sub_str("wwkew") == "w"
    assert LongestSubstr.longest_sub_str("wkew") == "wke"
    assert LongestSubstr.run("pwwkew") == 3
    assert LongestSubstr.run("bbbbb") == 1
    assert LongestSubstr.run("abcabcbb") == 3
  end
end
