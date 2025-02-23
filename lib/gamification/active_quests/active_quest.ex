defmodule Gamification.ActiveQuests.ActiveQuest do
  use Ecto.Schema
  import Ecto.Changeset

  schema "active_quests" do
    field :status, :string
    field :started_at, :naive_datetime
    field :completed_at, :naive_datetime
    field :player_id, :id
    field :quest_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(active_quest, attrs) do
    active_quest
    |> cast(attrs, [:started_at, :completed_at, :status])
    |> validate_required([:started_at, :completed_at, :status])
  end
end
