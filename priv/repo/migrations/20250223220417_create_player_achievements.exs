defmodule Gamification.Repo.Migrations.CreatePlayerAchievements do
  use Ecto.Migration

  def change do
    create table(:player_achievements) do
      add :achieved_at, :naive_datetime
      add :player_id, references(:players, on_delete: :nothing)
      add :achievement_id, references(:achievements, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:player_achievements, [:player_id])
    create index(:player_achievements, [:achievement_id])
  end
end
