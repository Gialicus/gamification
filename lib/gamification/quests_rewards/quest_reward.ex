defmodule Gamification.QuestsRewards.QuestReward do
  use Ecto.Schema
  import Ecto.Changeset

  schema "quests_rewards" do
    field :expire_at, :utc_datetime
    belongs_to :quest, Gamification.Quests.Quest
    belongs_to :reward, Gamification.Rewards.Reward
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(quest_reward, attrs) do
    quest_reward
    |> cast(attrs, [:expire_at])
    |> validate_required([:expire_at])
  end
end
