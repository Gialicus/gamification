defmodule Gamification.PlayersAchievementsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Gamification.PlayersAchievements` context.
  """

  @doc """
  Generate a player_achievement.
  """
  def player_achievement_fixture(attrs \\ %{}) do
    {:ok, player_achievement} =
      attrs
      |> Enum.into(%{
        achieved_at: ~N[2025-02-22 22:44:00]
      })
      |> Gamification.PlayersAchievements.create_player_achievement()

    player_achievement
  end
end
