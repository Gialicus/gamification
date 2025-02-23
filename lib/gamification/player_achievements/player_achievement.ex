defmodule Gamification.PlayerAchievements.PlayerAchievement do
  use Ecto.Schema
  import Ecto.Changeset

  schema "player_achievements" do
    field :achieved_at, :naive_datetime
    field :player_id, :id
    field :achievement_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(player_achievement, attrs) do
    player_achievement
    |> cast(attrs, [:achieved_at])
    |> validate_required([:achieved_at])
  end
end
