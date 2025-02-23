defmodule Gamification.QuestsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Gamification.Quests` context.
  """

  @doc """
  Generate a quest.
  """
  def quest_fixture(attrs \\ %{}) do
    {:ok, quest} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name",
        points_rewarded: 42
      })
      |> Gamification.Quests.create_quest()

    quest
  end
end
