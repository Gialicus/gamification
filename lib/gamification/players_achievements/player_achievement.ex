defmodule Gamification.PlayersAchievements.PlayerAchievement do
  use Ecto.Schema
  import Ecto.Changeset

  schema "players_achievements" do
    field :achieved_at, :naive_datetime
    belongs_to :player, Gamification.Players.Player
    belongs_to :achievement, Gamification.Achievements.Achievement
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(player_achievement, attrs) do
    player_achievement
    |> cast(attrs, [:achieved_at])
    |> validate_required([:achieved_at])
  end
end
