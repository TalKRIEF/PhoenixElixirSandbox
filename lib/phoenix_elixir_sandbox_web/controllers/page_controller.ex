defmodule PhoenixElixirSandboxWeb.PageController do
  use PhoenixElixirSandboxWeb, :controller

  def index do
  end

  def home(conn, _params) do
    render(conn, :home)
  end

  # This one actuaylly is an index but for testing purposes I renamed it
  def testplay(conn, _params) do
    render(conn, :testplay)
    # Ecto find id
  end
end
