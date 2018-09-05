defmodule BinaryTree do
  def sort(%TreeNode{} = node) do
    node
    |> create_depth_pairs()
    |> flatten_and_compact()
    |> sort_depth_pairs()
    |> remove_levels_from_pairs()
  end

  defp create_depth_pairs(_, level \\ 0)
  defp create_depth_pairs(nil, _), do: nil
  defp create_depth_pairs(%TreeNode{} = node, level) do
    [
      {level, node.value},
      create_depth_pairs(node.left, level + 1),
      create_depth_pairs(node.right, level + 1)
    ]
  end

  defp flatten_and_compact(list) do
    list
    |> List.flatten()
    |> Enum.reject(&is_nil/1)
  end

  defp sort_depth_pairs(pairs) do
    Enum.sort(pairs, fn {pair_1_level, _}, {pair_2_level, _} ->
      pair_1_level <= pair_2_level
    end)
  end

  defp remove_levels_from_pairs(pairs) do
    Enum.map(pairs, fn {_, value} -> value end)
  end
end
