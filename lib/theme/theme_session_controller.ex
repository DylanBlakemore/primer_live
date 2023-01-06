defmodule PrimerLive.ThemeSessionController do
  defmacro __using__(_) do
    quote do
      @session_payload_key "payload"
      @session_theme_key PrimerLive.Theme.session_theme_key()

      def set(conn, data) when is_map_key(data, @session_payload_key),
        do: store_session(conn, @session_theme_key, Map.get(data, @session_payload_key))

      defp store_session(conn, key, value) do
        conn
        |> put_session(key, value)
        |> json("ok")
      end
    end
  end
end
