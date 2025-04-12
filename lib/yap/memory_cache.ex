defmodule Yap.MemoryCache do
  def setup do
    :ets.new(:cache, [:named_table, :set, :public, read_concurrency: true])
  end

  def set(key, value) do
    :ets.insert(:cache, {key, value})
  end

  def get(key) do
    case :ets.lookup(:cache, key) do
      [] -> nil
      [{_key, value}] -> value
    end
  end

  def delete(key) do
    :ets.delete(:cache, key)
  end
end
