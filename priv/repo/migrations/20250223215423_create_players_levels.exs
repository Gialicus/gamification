defmodule Gamification.Repo.Migrations.CreatePlayersLevels do
  use Ecto.Migration

  def change do
    create table(:players_levels) do
      add :unlocked_at, :naive_datetime
      add :player_id, references(:players, on_delete: :nothing)
      add :level_id, references(:levels, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:players_levels, [:player_id])
    create index(:players_levels, [:level_id])
  end
end
