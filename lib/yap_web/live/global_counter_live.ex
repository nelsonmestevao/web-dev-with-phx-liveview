defmodule YapWeb.GlobalCounterLive do
  use YapWeb, :live_view

  alias Yap.GlobalCounter

  @impl true
  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash}>
      <div class="flex flex-col items-center justify-center">
        <div class="p-6 w-80 text-center">
          <h1 class="text-3xl font-bold mb-4">Global Counter</h1>
          <p class="text-4xl font-semibold text-primary mb-6">{@count}</p>
          <div class="flex justify-center space-x-6">
            <.button phx-click="increment">+</.button>
            <.button phx-click="decrement">-</.button>
          </div>
        </div>
      </div>
    </Layouts.app>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, count: GlobalCounter.get())}
  end

  def handle_event("increment", _params, socket) do
    GlobalCounter.increment()
    {:noreply, assign(socket, count: GlobalCounter.get())}
  end

  @impl true
  def handle_event("decrement", _params, socket) do
    GlobalCounter.decrement()
    {:noreply, assign(socket, count: GlobalCounter.get())}
  end
end
