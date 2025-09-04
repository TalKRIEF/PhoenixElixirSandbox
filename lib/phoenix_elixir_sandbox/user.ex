defmodule PhoenixElixirSandbox.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :email, :string
    field :number_of_pets, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :number_of_pets])
    |> validate_required([:name, :email, :number_of_pets])
  end
end
