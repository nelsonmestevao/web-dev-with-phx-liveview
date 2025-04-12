defmodule Yap.GlobalCounter do
  use Agent

  @topic "global_counter"

  def start_link(_opts \\ []) do
    Agent.start_link(fn -> 0 end, name: __MODULE__)
  end

  def subscribe do
    Phoenix.PubSub.subscribe(Yap.PubSub, @topic)
  end

  def get do
    Agent.get(__MODULE__, & &1)
  end

  def increment do
    Agent.update(__MODULE__, fn count -> count + 1 end)
    broadcast()
  end

  def decrement do
    Agent.update(__MODULE__, fn count -> count - 1 end)
    broadcast()
  end

  defp broadcast do
    Phoenix.PubSub.broadcast(Yap.PubSub, @topic, {:global_counter, get()})
  end
end
