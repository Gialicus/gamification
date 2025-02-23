defmodule Gamification.Quests.Quest do
  use Ecto.Schema
  import Ecto.Changeset

  schema "quests" do
    field(:name, :string)
    field(:description, :string)
    field(:points_rewarded, :integer)
    field(:milestone_id, :id)

    many_to_many :players, Gamification.Players.Player,
      join_through: Gamification.ActiveQuests.ActiveQuest

    many_to_many :rewards, Gamification.Rewards.Reward,
      join_through: Gamification.QuestsRewards.QuestReward

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(quest, attrs) do
    quest
    |> cast(attrs, [:name, :description, :points_rewarded])
    |> validate_required([:name, :description, :points_rewarded])
  end
end
