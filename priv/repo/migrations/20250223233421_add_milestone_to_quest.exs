defmodule Gamification.Repo.Migrations.AddMilestoneToQuest do
  use Ecto.Migration

  def change do
    alter table(:quests) do
      add(:milestone_id, references(:milestones, on_delete: :nothing))
    end
  end
end
