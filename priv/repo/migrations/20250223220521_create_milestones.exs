defmodule Gamification.Repo.Migrations.CreateMilestones do
  use Ecto.Migration

  def change do
    create table(:milestones) do
      add :name, :string
      add :description, :text
      add :points_rewarded, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
