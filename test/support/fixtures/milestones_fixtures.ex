defmodule Gamification.MilestonesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Gamification.Milestones` context.
  """

  @doc """
  Generate a milestone.
  """
  def milestone_fixture(attrs \\ %{}) do
    {:ok, milestone} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name",
        points_rewarded: 42
      })
      |> Gamification.Milestones.create_milestone()

    milestone
  end
end
