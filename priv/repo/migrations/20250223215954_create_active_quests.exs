defmodule Gamification.Repo.Migrations.CreateActiveQuests do
  use Ecto.Migration

  def change do
    create table(:active_quests) do
      add :started_at, :naive_datetime
      add :completed_at, :naive_datetime
      add :status, :string
      add :player_id, references(:players, on_delete: :nothing)
      add :quest_id, references(:quests, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:active_quests, [:player_id])
    create index(:active_quests, [:quest_id])
  end
end
