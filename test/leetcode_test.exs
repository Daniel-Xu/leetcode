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

  test "meidian of tow array" do
    assert MedianOfTwoArray.run([1,2], [3, 4]) == 2.5
    assert MedianOfTwoArray.run([1,3], [2]) == 2
    assert MedianOfTwoArray.run([1], []) == 1
    assert MedianOfTwoArray.run([1], [2]) == 1.5
    assert MedianOfTwoArray.run([], []) == nil
  end

  # test "longest Palindromic substr" do
  #   assert LongestPalStr.run() == ""
  # end

  test "reverse integer" do
    assert ReverseInteger.run(123) == 321
    assert ReverseInteger.run(-123) == -321
    assert ReverseInteger.run(120) == 21
  end

  test "Most Water" do
    assert MostWater.run([1, 1]) == 1
  end

  test "Roman to i" do
    assert RomanToI.run("DCXXI") == 621
    assert RomanToI.run("XCVIII") == 98
    assert RomanToI.run("CCXXDIV") == 704
    assert RomanToI.run("CCXXXIV") == 234
  end

  test "3sum" do
    assert ThreeSum.run([-1, 0, 1, 2, -1, -4]) == [
      [-1, 0, 1],
      [-1, -1, 2]
    ]
  end

  test "letter combination" do
    assert LetterCombination.run("23") == ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"]
    assert LetterCombination.run("234") ==
      ["adg","adh","adi","aeg","aeh","aei","afg","afh","afi","bdg","bdh","bdi","beg","beh","bei","bfg","bfh","bfi","cdg","cdh","cdi","ceg","ceh","cei","cfg","cfh","cfi"]
  end

  test "valid ()" do
    assert ValidParen.run("()[]{}") == true
    assert ValidParen.run("([()]{})") == true
    assert ValidParen.run("([)]{})") == false
    assert ValidParen.run("(]") == false
    assert ValidParen.run("([)]") == false
  end

  test "merge sorted list" do
    assert MergeList.run([1, 2, 4], [1, 3, 4]) == [1, 1, 2, 3, 4, 4]
    assert MergeList.run([1], [1, 3, 4]) == [1, 1, 3, 4]
    assert MergeList.run([1, 2, 5], [1, 4]) == [1, 1, 2, 4, 5]
  end

  test "generate parens" do
    assert GenerateParen.run(3) ==
      [
        "((()))",
        "(()())",
        "(())()",
        "()(())",
        "()()()"
      ] |> Enum.sort()

    assert GenerateParen.run(5) ==
      ["((((()))))","(((()())))","(((())()))","(((()))())","(((())))()","((()(())))","((()()()))","((()())())","((()()))()","((())(()))","((())()())","((())())()","((()))(())","((()))()()","(()((())))","(()(()()))","(()(())())","(()(()))()","(()()(()))","(()()()())","(()()())()","(()())(())","(()())()()","(())((()))","(())(()())","(())(())()","(())()(())","(())()()()","()(((())))","()((()()))","()((())())","()((()))()","()(()(()))","()(()()())","()(()())()","()(())(())","()(())()()","()()((()))","()()(()())","()()(())()","()()()(())","()()()()()"]
      |> Enum.sort()
  end
end
