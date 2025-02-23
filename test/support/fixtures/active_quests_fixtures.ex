defmodule Gamification.ActiveQuestsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Gamification.ActiveQuests` context.
  """

  @doc """
  Generate a active_quest.
  """
  def active_quest_fixture(attrs \\ %{}) do
    {:ok, active_quest} =
      attrs
      |> Enum.into(%{
        completed_at: ~N[2025-02-22 21:59:00],
        started_at: ~N[2025-02-22 21:59:00],
        status: "some status"
      })
      |> Gamification.ActiveQuests.create_active_quest()

    active_quest
  end
end
