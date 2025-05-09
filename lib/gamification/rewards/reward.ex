defmodule Gamification.Rewards.Reward do
  use Ecto.Schema
  import Ecto.Changeset

  schema "rewards" do
    field :name, :string
    field :description, :string
    field :points_cost, :integer

    many_to_many :quests, Gamification.Quests.Quest,
      join_through: Gamification.QuestsRewards.QuestReward

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(reward, attrs) do
    reward
    |> cast(attrs, [:name, :description, :points_cost])
    |> validate_required([:name, :description, :points_cost])
  end
end
