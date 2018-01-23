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

  test "str str" do
    assert StrStr.run("hello", "ll") == 2
    assert StrStr.run("aaaaa", "bba") == -1
    assert StrStr.run("abaaaa", "aaa") == 2
  end

  test "permutation" do
    assert Permutation.run([2]) == [[2]]
    assert Permutation.run([1,2]) == [[1, 2], [2, 1]]
    assert Permutation.run([1,2,3]) ==
      [
        [1,2,3],
        [1,3,2],
        [2,1,3],
        [2,3,1],
        [3,1,2],
        [3,2,1]
      ]
  end

  test "rotate image" do
    assert RotateImage.run(
      [
        [1,2,3],
        [4,5,6],
        [7,8,9]
      ]
    ) ==
      [
        [7,4,1],
        [8,5,2],
        [9,6,3]
      ]

    assert RotateImage.run(
      [
        [ 5, 1, 9,11],
        [ 2, 4, 8,10],
        [13, 3, 6, 7],
        [15,14,12,16]
      ]
    ) ==
      [
        [15,13, 2, 5],
        [14, 3, 4, 1],
        [12, 6, 8, 9],
        [16, 7,10,11]
      ]
  end

  test "group anagrams" do
    assert GroupAnagrams.run(["eat", "tea", "tan", "ate", "nat", "bat"]) ==
      [
        ["ate", "tea", "eat"],
        ["nat","tan"],
        ["bat"]
      ] |> Enum.sort()
  end

  test "max subarray" do
    assert MaxSubarray.run([-2,1,-3,4,-1,2,1,-5,4]) == 6
    assert MaxSubarray.run([1, 2, -3, -4, 2, 7, -2, 3]) == 10
  end

  test "longest increasing seq" do
    assert LongestIncreasingSeq.run([5, 3, 4, 8, 6, 7]) == 4
    assert LongestIncreasingSeq.run([10, 9, 2, 5, 3, 7, 101, 18]) == 4
  end

  test "sell stock" do
    assert SellStock.run([7, 1, 5, 3, 6, 4]) == 5
    assert SellStock.run([7, 6, 4, 3, 1]) == 0
  end

  test "unique path" do
    assert UniquePath.run(1, 1) == 1
    assert UniquePath.run(3, 3) == 6
    assert UniquePath.run(5, 8) == 330
    assert UniquePath.run(11, 7) == 8008
  end

  test "climb stairs" do
    assert ClimbStairs.run(2) == 2
    assert ClimbStairs.run(3) == 3
    assert ClimbStairs.run(19) == 6765
    assert ClimbStairs.run(9) == 55
  end

  test "triangle" do
    assert Triangle.run(
      [
        [2],
        [3,4],
        [6,5,7],
        [4,1,8,3]
      ]) == 11
  end

  test "perfect square" do
    assert PerfectSquare.run(3) == 3
    assert PerfectSquare.run(9) == 1
    assert PerfectSquare.run(4) == 1
    assert PerfectSquare.run(13) == 2
    assert PerfectSquare.run(19293) == 3
  end

  test "unique BST" do
    assert UniqueBst.run(1) == 1
    assert UniqueBst.run(2) == 2
    assert UniqueBst.run(3) == 5
    assert UniqueBst.run(17) == 129644790
  end
end
