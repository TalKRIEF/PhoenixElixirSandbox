defmodule PhoenixElixirSandbox.Chatrooms.Chatroom do
  use Ecto.Schema
  import Ecto.Changeset

  schema "chatrooms" do
    field :title, :string
    field :video_link, :string
    belongs_to :user, PhoenixElixirSandbox.Accounts.User

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(chatroom, attrs) do
    chatroom
    |> cast(attrs, [:title, :video_link])
    |> validate_required([:title, :video_link])
  end

end
