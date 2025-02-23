defmodule Gamification.Milestones.Milestone do
  use Ecto.Schema
  import Ecto.Changeset

  schema "milestones" do
    field :name, :string
    field :description, :string
    field :points_rewarded, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(milestone, attrs) do
    milestone
    |> cast(attrs, [:name, :description, :points_rewarded])
    |> validate_required([:name, :description, :points_rewarded])
  end
end
