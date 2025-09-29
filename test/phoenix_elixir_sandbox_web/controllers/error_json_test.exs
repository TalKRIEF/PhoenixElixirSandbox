defmodule PhoenixElixirSandboxWeb.ErrorJSONTest do
  use PhoenixElixirSandboxWeb.ConnCase, async: true

  test "renders 404" do
    assert PhoenixElixirSandboxWeb.ErrorJSON.render("404.json", %{}) == %{
             errors: %{detail: "Not Found"}
           }
  end

  test "renders 500" do
    assert PhoenixElixirSandboxWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
