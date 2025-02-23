defmodule Gamification.PlayersLevelsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Gamification.PlayersLevels` context.
  """

  @doc """
  Generate a player_level.
  """
  def player_level_fixture(attrs \\ %{}) do
    {:ok, player_level} =
      attrs
      |> Enum.into(%{
        unlocked_at: ~N[2025-02-22 21:54:00]
      })
      |> Gamification.PlayersLevels.create_player_level()

    player_level
  end
end
