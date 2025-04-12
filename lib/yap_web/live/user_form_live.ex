defmodule YapWeb.UserFormLive do
  use YapWeb, :live_view

  alias Yap.MemoryCache

  @impl true
  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash}>
      <div class="flex gap-4 items-center">
        <img class="w-32 h-32 rounded-full" />
        <h1 class="text-2xl mt-4">USER NAME</h1>
      </div>

      <.form for={@form}>
        <.input label="Name" field={@form[:name]} />
        <.button type="submit">Submit</.button>
      </.form>
    </Layouts.app>
    """
  end

  def upload_avatar(assigns) do
    ~H"""
      <form
        id="upload-avatar"
        phx-change="validate-upload"
        phx-submit="submit-upload"
        phx-drop-target={@uploads.avatar.ref}
      >
        <p>User Avatar</p>
        <.live_file_input upload={@uploads.avatar} />

        <div :for={entry <- @uploads.avatar.entries} class="flex-col gap-6">
          <div class="flex-col">
            <.live_img_preview entry={entry} />
            <progress value={entry.progress} max="100">{entry.progress}%</progress>
          </div>
          <div class="flex gap-4 justify-end">
            <.button
              type="button"
              phx-click="cancel-upload"
              phx-value-ref={entry.ref}
              aria-label="cancel"
            >
              Cancel
            </.button>
            <.button variant="primary" type="submit">Upload</.button>
          </div>
        </div>
      </form>
"""
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:form, to_form(%{"name" => nil}, as: "user"))
     |> allow_upload(:avatar,
       accept: ~w(.jpg .jpeg .png),
       max_entries: 1,
       max_file_size: 5_000_000,
       auto_upload: true
     )}
  end

  def save_user_data!(socket, key, value) do
    data = MemoryCache.get(socket.assigns.whoami, %{name: nil, avatar: nil}) |> Map.put(key, value)
    true = MemoryCache.set(socket.assigns.whoami, data)
  end

  def validate_name(name) do
    trimmed = String.trim(name)

    []
    |> maybe_add_error(trimmed == "", {:name, {"can't be blank", []}})
    |> maybe_add_error(
      String.length(trimmed) > 50,
      {:name, {"can't be longer than 50 characters", []}}
    )
  end

  defp maybe_add_error(errors, true, error), do: [error | errors]
  defp maybe_add_error(errors, false, _error), do: errors
end
