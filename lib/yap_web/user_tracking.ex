defmodule YapWeb.UserTracking do
  import Plug.Conn

  @cookie_name "whoami"

  def build_session(conn) do
    %{"whoami" => conn.assigns[:whoami]}
  end

  def ensure_anonymous_cookie(conn, _opts) do
    conn = fetch_cookies(conn, signed: [@cookie_name])

    case Map.get(conn.cookies, @cookie_name) do
      nil ->
        anon_id = Ecto.UUID.generate()

        conn
        |> put_resp_cookie(@cookie_name, anon_id,
          sign: true,
          max_age: 60 * 60 * 24 * 365
        )
        |> assign(:whoami, anon_id)

      anon_id ->
        assign(conn, :whoami, anon_id)
    end
  end
end
