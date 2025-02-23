defmodule Gamification.AchievementsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Gamification.Achievements` context.
  """

  @doc """
  Generate a achievement.
  """
  def achievement_fixture(attrs \\ %{}) do
    {:ok, achievement} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name",
        points_awarded: 42
      })
      |> Gamification.Achievements.create_achievement()

    achievement
  end
end
