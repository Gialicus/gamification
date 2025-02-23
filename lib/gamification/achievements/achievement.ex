defmodule Gamification.Achievements.Achievement do
  use Ecto.Schema
  import Ecto.Changeset

  schema "achievements" do
    field :name, :string
    field :description, :string
    field :points_awarded, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(achievement, attrs) do
    achievement
    |> cast(attrs, [:name, :description, :points_awarded])
    |> validate_required([:name, :description, :points_awarded])
  end
end
