defmodule PhoenixElixirSandboxWeb.PageController do
  use PhoenixElixirSandboxWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end

  def random(conn, _params) do
    render(conn, :random)
  end
end
