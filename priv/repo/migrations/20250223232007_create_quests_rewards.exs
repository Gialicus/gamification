defmodule Gamification.Repo.Migrations.CreateQuestsRewards do
  use Ecto.Migration

  def change do
    create table(:quests_rewards) do
      add :expire_at, :utc_datetime
      add :quest_id, references(:quests, on_delete: :nothing)
      add :reward_id, references(:rewards, on_delete: :nothing)
      timestamps(type: :utc_datetime)
    end

    create index(:quests_rewards, [:quest_id])
    create index(:quests_rewards, [:reward_id])
  end
end
