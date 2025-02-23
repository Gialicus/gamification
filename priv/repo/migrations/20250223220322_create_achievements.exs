defmodule Gamification.Repo.Migrations.CreateAchievements do
  use Ecto.Migration

  def change do
    create table(:achievements) do
      add :name, :string
      add :description, :text
      add :points_awarded, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
