defmodule BinaryTreeTest do
  use ExUnit.Case
  doctest BinaryTree

  test "should return an array with a single entry" do
    tree = %TreeNode{value: 9}
    assert BinaryTree.sort(tree) == [9]
  end

  test "should return [1, 8, 9] for one-level nested nodes" do
    tree =
      %TreeNode{
        value: 1,
        left: %TreeNode{value: 8},
        right: %TreeNode{value: 9}
      }
    assert BinaryTree.sort(tree) == [1,8,9]
  end

  test "should return [2,8,9,1,3,4,5] for the example two-level tree" do
    tree =
      %TreeNode{
        value: 2,
        left: %TreeNode{
          value: 8,
          left: %TreeNode{value: 1},
          right: %TreeNode{value: 3}
        },
        right: %TreeNode{
          value: 9,
          left: %TreeNode{value: 4},
          right: %TreeNode{value: 5}
        }
      }
    assert BinaryTree.sort(tree) == [2,8,9,1,3,4,5]
  end

  test "should return [1,2,3,4,5,6,7,8,9,10] for a more complicated tree" do
    #            1
    #       2        3
    #         4     5 6
    #       7      8
    #             9 10
    tree =
      %TreeNode{
        value: 1,
        left: %TreeNode{
          value: 2,
          right: %TreeNode{value: 4, left: %TreeNode{value: 7}}
        },
        right: %TreeNode{
          value: 3,
          left: %TreeNode{
            value: 5,
            left: %TreeNode{
              value: 8,
              left: %TreeNode{value: 9},
              right: %TreeNode{value: 10}
            }
          },
          right: %TreeNode{value: 6}
        }
      }
    assert BinaryTree.sort(tree) == [1,2,3,4,5,6,7,8,9,10]
  end
end
