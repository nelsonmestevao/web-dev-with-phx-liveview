defmodule YapWeb.UserFormLive do
  use YapWeb, :live_view

  alias Yap.MemoryCache

  @impl true
  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash}>
      <div class="flex gap-4 items-center">
        <img :if={@avatar} src={"/uploads/#{@avatar}"} class="w-32 h-32 rounded-full" />
        <h1 :if={@name} class="text-2xl mt-4">{@name}</h1>
      </div>

      <.upload_avatar uploads={@uploads} />

      <.form for={@form} phx-change="validate-user-data" phx-submit="submit-user-data">
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
  def mount(_params, %{"whoami" => whoami}, socket) do
    data = MemoryCache.get(whoami, %{name: nil, avatar: nil})

    {:ok,
     socket
     |> assign(:whoami, whoami)
     |> assign(:name, data.name)
     |> assign(:avatar, data[:avatar])
     |> assign(:form, to_form(%{"name" => nil}, as: "user"))
     |> allow_upload(:avatar,
       accept: ~w(.jpg .jpeg .png),
       max_entries: 1,
       max_file_size: 5_000_000,
       auto_upload: true
     )}
  end

  @impl true
  def handle_event("validate-upload", _params, socket) do
    {:noreply, socket}
  end

  @impl true
  def handle_event("submit-upload", _params, socket) do
    [avatar] =
      consume_uploaded_entries(socket, :avatar, fn %{path: path}, _entry ->
        dest = Path.join("priv/static/uploads", Path.basename(path))

        File.cp!(path, dest)

        save_user_data!(socket, :avatar, Path.basename(dest))

        {:ok, dest}
      end)

    {:noreply, assign(socket, avatar: avatar)}
  end

  @impl true
  def handle_event("cancel-upload", %{"ref" => ref}, socket) do
    {:noreply, cancel_upload(socket, :avatar, ref)}
  end

  @impl true
  def handle_event("validate-user-data", %{"user" => %{"name" => name}}, socket) do
    errors = validate_name(name)

    form = to_form(%{"name" => name}, as: "user", errors: errors)

    {:noreply, assign(socket, form: form)}
  end

  @impl true
  def handle_event("submit-user-data", %{"user" => %{"name" => name}}, socket) do
    case validate_name(name) do
      [] ->
        save_user_data!(socket, :name, name)

        {:noreply, assign(socket, name: name)}

      errors ->
        form = to_form(%{"name" => name}, as: "user", errors: errors)

        {:noreply, assign(socket, form: form)}
    end
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
