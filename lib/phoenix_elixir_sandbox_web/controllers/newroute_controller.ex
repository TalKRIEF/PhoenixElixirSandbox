defmodule PhoenixElixirSandboxWeb.NewrouteController do
  use PhoenixElixirSandboxWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end

  def show(conn, %{"name" => name} = _params) do
    render(conn, :show, name: name)
  end
end
