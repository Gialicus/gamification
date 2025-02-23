defmodule Gamification.PlayersLevels.PlayerLevel do
  use Ecto.Schema
  import Ecto.Changeset

  schema "players_levels" do
    field :unlocked_at, :naive_datetime
    field :player_id, :id
    field :level_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(player_level, attrs) do
    player_level
    |> cast(attrs, [:unlocked_at])
    |> validate_required([:unlocked_at])
  end
end
