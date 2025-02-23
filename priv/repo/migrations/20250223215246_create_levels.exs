defmodule Gamification.Repo.Migrations.CreateLevels do
  use Ecto.Migration

  def change do
    create table(:levels) do
      add :name, :string
      add :description, :text
      add :points_required, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
