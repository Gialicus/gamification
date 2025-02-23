defmodule Gamification.PlayersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Gamification.Players` context.
  """

  @doc """
  Generate a player.
  """
  def player_fixture(attrs \\ %{}) do
    {:ok, player} =
      attrs
      |> Enum.into(%{
        email: "some email",
        name: "some name",
        score: 42
      })
      |> Gamification.Players.create_player()

    player
  end
end
