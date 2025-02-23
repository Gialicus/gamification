defmodule Gamification.Players.Player do
  use Ecto.Schema
  import Ecto.Changeset

  schema "players" do
    field(:name, :string)
    field(:email, :string)
    field(:level, :integer)
    field(:score, :integer)

    many_to_many :quests, Gamification.Quests.Quest,
      join_through: Gamification.ActiveQuests.ActiveQuest

    many_to_many :achievements, Gamification.Achievements.Achievement,
      join_through: Gamification.PlayersAchievements.PlayerAchievement

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(player, attrs) do
    player
    |> cast(attrs, [:name, :email, :score])
    |> validate_required([:name, :email, :score])
  end
end
