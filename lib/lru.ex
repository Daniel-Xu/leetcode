defmodule LRU do
  defstruct(capacity: 0, elements: %{}, order: [])
  def new(capacity \\ 0) do
    %LRU{capacity: capacity}
  end

  def get(cache, key) do
    case Map.get(cache.elements, key) do
      nil -> {-1, cache}
      n -> {n, update_order(cache, key)}
    end
  end

  @doc """
  if cache is full
  = delete last order, delete related cache record
  = insert new order and new cache record
  else
  = insert new order and new cache record
  """
  def put(cache, key, v) do
    cache = update_in(cache.elements, &(Map.delete(&1, key)))
    cache = update_in(cache.order, &(List.delete(&1, key)))

    {l, e} = if length(cache.order) >= cache.capacity do
      cache_key = List.last(cache.order)
      {List.delete(cache.order, cache_key), Map.delete(cache.elements, cache_key)}
    else
      {cache.order, cache.elements}
    end
    l = [key | l]
    Map.put(cache, :elements, Map.put(e, key, v))
    |> Map.put(:order, l)
  end

  @doc """
  delete key from the order, and add the key the head of the order
  """
  defp update_order(cache, key) do
    Map.update(cache, :order, [], &[key | List.delete(&1, key)])
  end
end
