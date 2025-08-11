defmodule PhoenixElixirSandbox.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_elixir_sandbox,
    adapter: Ecto.Adapters.Postgres
end
