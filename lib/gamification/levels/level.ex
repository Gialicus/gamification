defmodule Gamification.Levels.Level do
  use Ecto.Schema
  import Ecto.Changeset

  schema "levels" do
    field :name, :string
    field :description, :string
    field :points_required, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(level, attrs) do
    level
    |> cast(attrs, [:name, :description, :points_required])
    |> validate_required([:name, :description, :points_required])
  end
end
