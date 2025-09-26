defmodule PhoenixElixirSandboxWeb.ChatroomController do
  use PhoenixElixirSandboxWeb, :controller


  def index(conn, _params) do
    conn
  end
  def show(conn, %{"id" => id}) do
    render(conn, "show.html", id: id)
  end
end
