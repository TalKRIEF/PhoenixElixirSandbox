defmodule PhoenixElixirSandboxWeb.NewrouteController do
  use PhoenixElixirSandboxWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end
end
