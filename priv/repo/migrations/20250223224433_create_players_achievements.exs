defmodule Gamification.Repo.Migrations.CreatePlayersAchievements do
  use Ecto.Migration

  def change do
    create table(:players_achievements) do
      add :achieved_at, :naive_datetime
      add :player_id, references(:players, on_delete: :nothing)
      add :achievement_id, references(:achievements, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:players_achievements, [:player_id])
    create index(:players_achievements, [:achievement_id])
  end
end
