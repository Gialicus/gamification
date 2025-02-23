defmodule Gamification.LevelsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Gamification.Levels` context.
  """

  @doc """
  Generate a level.
  """
  def level_fixture(attrs \\ %{}) do
    {:ok, level} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name",
        points_required: 42
      })
      |> Gamification.Levels.create_level()

    level
  end
end
