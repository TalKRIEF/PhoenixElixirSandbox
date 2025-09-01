defmodule PhoenixElixirSandboxWeb.RandomController do
  use PhoenixElixirSandboxWeb, :controller

  def random(conn, _params) do
    render(conn, :random)
  end

end
