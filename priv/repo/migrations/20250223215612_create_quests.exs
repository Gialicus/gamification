defmodule Gamification.Repo.Migrations.CreateQuests do
  use Ecto.Migration

  def change do
    create table(:quests) do
      add(:name, :string)
      add(:description, :text)
      add(:points_rewarded, :integer)
      add(:milestone_id, references(:milestones, on_delete: :nothing))

      timestamps(type: :utc_datetime)
    end
  end
end
