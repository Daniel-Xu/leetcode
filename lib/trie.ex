defmodule Trie do
  defstruct(trie: %{})

  def new(), do: %Trie{}

  def new(binary), do: insert(Trie.new(), binary)

  def insert(%Trie{trie: trie}, binary) do
    %Trie{trie: do_insert(trie, binary)}
  end

  def contains?(%Trie{trie: trie}, binary) do
    do_contains?(trie, binary)
  end

  defp do_contains?(%{mark: :mark}, <<>>), do: true
  defp do_contains?(_trie, <<>>), do: false
  defp do_contains?(trie, <<h, t::binary>>) do
    if Map.has_key?(trie, h), do: do_contains?(trie[h], t), else: false
  end

  @doc """
  if key is not present:
  = insert whole string to a new map
  if key is  present:
  = insert rest in it
  """
  defp do_insert(trie, <<>>), do: Map.put(trie, :mark, :mark)
  defp do_insert(trie, <<h, t::binary>>) do
    Map.update(trie, h, do_insert(%{}, t), &(do_insert(&1, t)))
  end
end
