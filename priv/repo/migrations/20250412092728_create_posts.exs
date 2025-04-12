defmodule Yap.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :title, :string
      add :body, :text
      add :published, :boolean, default: false, null: false

      timestamps(type: :utc_datetime)
    end
  end
end
