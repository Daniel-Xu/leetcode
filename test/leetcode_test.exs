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

  test "longest Palindromic substr" do
    assert LongestPalStr.run("babad") == "bab"
    assert LongestPalStr.run("cbbd") == "bb"
  end

  test "reverse integer" do
    assert ReverseInteger.run(123) == 321
    assert ReverseInteger.run(-123) == -321
    assert ReverseInteger.run(120) == 21
  end

  test "Most Water" do
    assert MostWater.run([1, 1]) == 1
    assert MostWater.run([8, 2, 5, 4, 7]) == 28
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

  test "edit distance" do
    assert EditDistance.run("", "") == 0
    assert EditDistance.run("whas up", "whosls") == 4
    assert EditDistance.run("whas up", "whas so") == 2
  end

  test "course schedule" do
    assert CourseSchedule.run(2, [[1, 0]]) == true
    assert CourseSchedule.run(2, [[1,0],[0,1]]) == false
    assert CourseSchedule.run(3, [[1, 2], [2, 1]]) == false
    assert CourseSchedule.run(3, [[1, 0], [2, 1]]) == true
    assert CourseSchedule.run(3, [[1, 0], [2, 0]]) == true
  end

  test "tree node" do
    #             3
    #           /   \
    #          15    8
    #        /  \   /  \
    #      22  18  14   4
    #     /      \     / \
    #    30      35   11  25
    tree = %TreeNode{
      val: 3,
      left: %TreeNode{
        val: 15,
        left: %TreeNode{
          val: 22,
          left: %TreeNode{
            val: 30
          }
        },
        right: %TreeNode{
          val: 18,
          right: %TreeNode{
            val: 35
          }
        }
      },
      right: %TreeNode{
        val: 8,
        left: %TreeNode{
          val: 14
        },
        right: %TreeNode{
          val: 4,
          left: %TreeNode{
            val: 11
          },
          right: %TreeNode{
            val: 25
          },
        }
      }
    }

    assert TreeNode.pre_order_traversal(tree) == [3, 15, 22, 30, 18, 35, 8, 14, 4, 11, 25]
    assert TreeNode.in_order_traversal(tree) == [30, 22, 15, 18, 35, 3, 14, 8, 11, 4, 25]
    assert TreeNode.post_order_traversal(tree) == [30, 22, 35, 18, 15, 14, 11, 25, 4, 8, 3]
    assert TreeNode.queue_traversal(tree) == [3, 15, 8, 22, 18, 14, 4, 30, 35, 11, 25]
    assert TreeNode.height(tree) == 4
    assert TreeNode.build_bst_tree([2, 1, 3]) == %TreeNode{val: 2, left: %TreeNode{val: 1, left: nil, right: nil}, right: %TreeNode{val: 3, left: nil, right: nil}}

    assert TreeNode.build_bst_from_sorted_list([1,2,3,4,5,6]) ==
      %TreeNode{
        left: %TreeNode{
          left: TreeNode.new(1),
          right: TreeNode.new(3),
          val: 2
        },
        right: %TreeNode{
          left: TreeNode.new(5),
          right: nil,
          val: 6
        },
        val: 4
      }

    assert TreeNode.build_bst_from_sorted_list([-10,-3,0,5,9]) |> TreeNode.queue_traversal() == [0, -3, 9, -10, 5]

    assert TreeNode.build_tree_from_pre_in_order([3,9,20,15,7], [9,3,15,20,7])
    |> TreeNode.queue_traversal() == [3, 9, 20, 15, 7]

    assert TreeNode.build_tree_from_in_post_order([9,3,15,20,7], [9,15,7,20,3])
    |> TreeNode.queue_traversal() == [3, 9, 20, 15, 7]
  end

  test "iterator" do
    # 3
    #2 4
    n1 = TreeNode.new(2)
    n2 = TreeNode.new(4)
    n3 = TreeNode.new(3, n1, n2)
    i = Iterator.new(n3)
    {n, i} = Iterator.next(i)
    assert n == 2
    {n, i} = Iterator.next(i)
    assert n == 3
    {n, i} = Iterator.next(i)
    assert n == 4
    {n, i} = Iterator.next(i)
    assert n == nil
    assert i == %Iterator{stack: []}
    {n, _i} = Iterator.next(i)
    assert n == nil
  end

  test "balanced tree" do
    n1 = TreeNode.new(2)
    n2 = TreeNode.new(4)
    n3 = TreeNode.new(3, n1, n2)

    n4 = TreeNode.new(3, nil, n3)
    assert BalancedTree.balance?(n3) == true
    assert BalancedTree.balance?(n4) == false
  end

  test "binary tree paths" do
    n1 = TreeNode.new(2)
    n2 = TreeNode.new(4)
    n3 = TreeNode.new(3, n1, n2)
    assert BinaryTreePaths.paths(n3) == ["3->2", "3->4"]
    n1 = TreeNode.new(2, nil, TreeNode.new(5))
    n2 = TreeNode.new(3)
    n3 = TreeNode.new(1, n1, n2)
    assert BinaryTreePaths.paths(n3) == ["1->2->5", "1->3"]

    tree = %TreeNode{
      val: 3,
      left: %TreeNode{
        val: 15,
        left: %TreeNode{
          val: 22,
          left: %TreeNode{
            val: 30
          }
        },
        right: %TreeNode{
          val: 18,
          right: %TreeNode{
            val: 35
          }
        }
      },
      right: %TreeNode{
        val: 8,
        left: %TreeNode{
          val: 14
        },
        right: %TreeNode{
          val: 4,
          left: %TreeNode{
            val: 11
          },
          right: %TreeNode{
            val: 25
          },
        }
      }
    }
    #             3
    #           /   \
    #          15    8
    #        /  \   /  \
    #      22  18  14   4
    #     /      \     / \
    #    30      35   11  25
    assert BinaryTreePaths.paths(tree) == ["3->15->22->30", "3->15->18->35", "3->8->14", "3->8->4->11", "3->8->4->25"]
  end

  test "target sum" do
    assert TargetSum.run([1, 1, 1, 1, 1], 3) == 5
    assert TargetSum.run([1, 2,1,4,1], 6) == 0
    assert TargetSum.run([1, 2,1,4,1], 7) == 3
  end

  test "sum root to leaves" do
    tree = TreeNode.new(1, TreeNode.new(2), TreeNode.new(3))
    assert SumToLeaf.run(tree) == 25
    tree = TreeNode.build_bst_tree([5, 3, 6, 2, 4, 9, 8])
    assert SumToLeaf.run(tree) == 6764
    tree = TreeNode.build_bst_tree([5, 3, 6, 2, 4, 9])
    assert SumToLeaf.run(tree) == 1635
  end

  test "path sum 1 & 2" do
    tree = %TreeNode{
      left: %TreeNode{
        val: 4,
        left: %TreeNode{
          val: 11,
          left: TreeNode.new(7),
          right: TreeNode.new(2)
        }
      },
      right: %TreeNode{
        val: 8,
        left: TreeNode.new(13),
        right: %TreeNode{
          val: 4,
          left: TreeNode.new(5),
          right: TreeNode.new(1)
        }
      },
      val: 5
    }

    assert PathSum1.run(tree, 22) == true
    assert PathSum1.run(tree, 100) == false
    assert PathSum2.run(tree, 22) ==
      [
        [5,4,11,2],
        [5,8,4,5]
      ]
  end

  test "max depth" do
    tree = TreeNode.build_bst_tree([5, 3, 6, 2, 4, 9, 8])
    assert MaxDepth.run(tree) == 4

    tree = TreeNode.build_bst_tree([5, 3, 6])
    assert MaxDepth.run(tree) == 2
  end

  test "flatten binary tree" do
    tree = TreeNode.build_bst_tree([5, 3, 6, 2, 4, 9])
    assert FlattenBinaryTree.run(tree) == [5, 3, 2, 4, 6, 9]
  end

  test "symmetric tree" do
    tree = %TreeNode{
      left: %TreeNode{
        left: TreeNode.new(3),
        right: TreeNode.new(4),
        val: 2
      },
      right: %TreeNode{
        right: TreeNode.new(3),
        left: TreeNode.new(4),
        val: 2
      },
      val: 1
    }

    assert SymmetricTree.run(tree) == true
    tree = TreeNode.build_bst_from_sorted_list([1,2, 3, 4, 5, 6])
    assert SymmetricTree.run(tree) == false
  end

  test "valid BST" do
    tree = TreeNode.build_bst_from_sorted_list([1, 2, 3, 4, 5, 6, 7])
    assert ValidBST.run(tree) == true
    tree = TreeNode.new(10, TreeNode.new(10), TreeNode.new(1))
    assert ValidBST.run(tree) == false
  end

  test "LRU" do
    cache = LRU.new(2)
    cache = LRU.put(cache, 1, 1)
    cache = LRU.put(cache, 1, 1)
    cache = LRU.put(cache, 2, 2)
    {n, cache} = LRU.get(cache, 1)
    assert n == 1
    cache = LRU.put(cache, 3, 3)
    {n, cache} = LRU.get(cache, 2)
    assert n == -1
    cache = LRU.put(cache, 4, 4)
    {n, cache} = LRU.get(cache, 1)
    assert n == -1
    {n, cache} = LRU.get(cache, 3)
    assert n == 3
    {n, _cache} = LRU.get(cache, 4)
    assert n == 4
  end

  test "decode way" do
    assert DecodeWay.run("122312342432") == 30
    assert DecodeWay.run("12") == 2
    assert DecodeWay.run("993202837212210") == 5
    assert DecodeWay.run("993202837212210") == 5
    assert DecodeWay.run("993202837212290") == 0
  end

  test "trie" do
    t = Trie.new("apple")
    t = Trie.insert(t, "ape")
    t = Trie.insert(t, "ap")

    assert Trie.contains?(t, "apple") == true
    assert Trie.contains?(t, "ape") == true
    assert Trie.contains?(t, "ap") == true

    assert Trie.start_with(t, "ap") == ["ape", "apple", "ap"]
    assert Trie.start_with(t, "app") == ["apple"]
  end

  test "word search" do
    assert WordSearch.run("ABCCED") == true
    assert WordSearch.run("ASADFBCCEESE") == true
    assert WordSearch.run("SEE") == true
    assert WordSearch.run("ABCB") == false
  end

  test "word search 2" do
    assert WordSearch2.run(["oath","pea","eat","rain"]) |> Enum.sort() == ["eat","oath"] |> Enum.sort()
  end

  test "valid cal" do
    assert ValidCal.run("1 + 1") == 2
    assert ValidCal.run(" 2-1 + 2 ") == 3
    assert ValidCal.run("(1+(4+15+2)-3)+(6+8)") == 33
  end

  test "valid cal2" do
    assert ValidCal2.run("1 + 1") == 2
    assert ValidCal2.run("-1 + 1") == 0
    assert ValidCal2.run(" 2 * 1 + 2 ") == 4
    assert ValidCal2.run("1 + 2 / 3 * 2") == 1
  end
end
