defmodule YapWeb.GlobalCounterLive do
  use YapWeb, :live_view

  alias Yap.GlobalCounter

  @impl true
  def render(assigns) do
    ~H"""
    <span>Global Counter: {@count}</span>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, count: GlobalCounter.get())}
  end
end
