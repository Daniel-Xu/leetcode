# Leetcode

## DFS

When you tried to solve a problem with DFS, you need to think about:

1. base case
2. what do you want to accumulate during the traversal
3. what is the start node and connected nodes
4. how do you want to deal with the return value from each branch

take the `path_sum_2` as an example:

```
              5
             / \
            4   8
           /   / \
          11  13  4
         /  \      \
        7    2      1
```
1. the base case is:
we need to return the accumulator when we reach the leaf node

2. the accumulator:
we accumulate the node value during the traversal, it's
`[5, 4, 11, 7], [5, 4, 11, 2], [5, 8, 13], [5, 8, 4, 1]`

3. the start node will determine the connected nodes:
In matrix, it's `[{x, y-1}, {x, y+1}, {x+1, y}, {x-1, y}]`,
in binary tree, it's `[left, right]`

4. when the recursive returns, how do we want to deal with the result:
In the code bellow:
```Elixir
  def dfs_visit(root, acc, target) do
    Enum.filter([root.left, root.right], fn x -> not is_nil(x) end)
    |> Enum.reduce([], fn x, res ->
      r = dfs_visit(x, acc ++ [root.val], target)
      res ++ r
    end)
  end
```
when `defs_visit` returns, we got the return value, it's what we set up in the base case.
The first parameter is `[]` which means each time we go back to the upper level,
it will have a `[]` as initial value. However, for current level, we will merge result from left and right branch.

It will look like this:
```
-> [] ++ [[5, 4, 11, 7]] = [[5, 4, 11, 7]]
current level:
-> [[5, 4, 11, 7]] ++ [[5, 4, 11, 2]] = [[5, 4, 11, 7], [5, 4, 11, 2]]
go up one level:
-> [] ++ [[5, 4, 11, 7], [5, 4, 11, 2]]
and so on.
```
We can also use flat_map:

```Elixir
  def dfs_visit(root, acc, target) do
    Enum.filter([root.left, root.right], fn x -> not is_nil(x) end)
    |> Enum.flat_map(fn x ->
      dfs_visit(x, acc ++ [root.val], target)
    end)
  end
```
