defmodule PhoenixElixirSandboxWeb.HelloController do
  use PhoenixElixirSandboxWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end

  def show(conn, %{"messenger" => messenger} = params) do
    render(conn, :show, messenger: messenger)
    # Commit
  end
end
