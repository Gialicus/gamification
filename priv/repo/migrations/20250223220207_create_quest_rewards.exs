defmodule Gamification.Repo.Migrations.CreateQuestRewards do
  use Ecto.Migration

  def change do
    create table(:quest_rewards) do
      add :quest_id, references(:quests, on_delete: :nothing)
      add :reward_id, references(:rewards, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:quest_rewards, [:quest_id])
    create index(:quest_rewards, [:reward_id])
  end
end
