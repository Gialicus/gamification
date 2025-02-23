defmodule Gamification.Quests.Quest do
  use Ecto.Schema
  import Ecto.Changeset

  schema "quests" do
    field :name, :string
    field :description, :string
    field :points_rewarded, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(quest, attrs) do
    quest
    |> cast(attrs, [:name, :description, :points_rewarded])
    |> validate_required([:name, :description, :points_rewarded])
  end
end
