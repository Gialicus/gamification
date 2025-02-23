defmodule Gamification.Milestones.Milestone do
  use Ecto.Schema
  import Ecto.Changeset

  schema "milestones" do
    field :name, :string
    field :description, :string
    field :points_rewarded, :integer
    has_many :quests, Gamification.Quests.Quest
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(milestone, attrs) do
    milestone
    |> cast(attrs, [:name, :description, :points_rewarded])
    |> validate_required([:name, :description, :points_rewarded])
  end
end
