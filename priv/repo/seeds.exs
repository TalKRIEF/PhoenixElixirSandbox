# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     PhoenixElixirSandbox.Repo.insert!(%PhoenixElixirSandbox.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias PhoenixElixirSandbox.Accounts
alias PhoenixElixirSandbox.Repo

Repo.delete_all(PhoenixElixirSandbox.User)

IO.puts(
  "________________________________________________All Users have been deleted___________________________________________"
)

IO.puts(
  "________________________________________________All Users have been deleted___________________________________________"
)

IO.puts(
  "________________________________________________All Users have been deleted___________________________________________"
)

IO.puts(
  "________________________________________________All Users have been deleted___________________________________________"
)

Accounts.create_user(%{name: "Chloé", email: "chloe@yahoo.fr", password: "talouleplusbeau"})
IO.puts("................................Chloé user created................................")
Accounts.create_user(%{name: "Tal", email: "tal@gmail.com", password: "OOOOOO"})
IO.puts("................................Tal user created................................")
Accounts.create_user(%{name: "Teva", email: "tevakr@hotmail.fr", password: "BestTKintown"})
IO.puts("................................Teva user created................................")
