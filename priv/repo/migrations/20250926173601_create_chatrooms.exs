defmodule PhoenixElixirSandbox.Repo.Migrations.CreateChatrooms do
  use Ecto.Migration

  def change do
    create table(:chatrooms) do
      add :title, :string
      add :video_link, :string
      add :user_id, references(:users, on_delete: :delete_all)

      timestamps(type: :utc_datetime)
    end

    create index(:chatrooms, [:user_id])
  end
end
