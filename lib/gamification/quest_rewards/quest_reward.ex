defmodule Gamification.QuestRewards.QuestReward do
  use Ecto.Schema
  import Ecto.Changeset

  schema "quest_rewards" do

    field :quest_id, :id
    field :reward_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(quest_reward, attrs) do
    quest_reward
    |> cast(attrs, [])
    |> validate_required([])
  end
end
