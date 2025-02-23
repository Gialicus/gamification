defmodule Gamification.Repo.Migrations.CreateQuests do
  use Ecto.Migration

  def change do
    create table(:quests) do
      add(:name, :string)
      add(:description, :text)
      add(:points_rewarded, :integer)

      timestamps(type: :utc_datetime)
    end
  end
end
