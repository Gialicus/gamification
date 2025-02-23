defmodule Gamification.QuestsRewardsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Gamification.QuestsRewards` context.
  """

  @doc """
  Generate a quest_reward.
  """
  def quest_reward_fixture(attrs \\ %{}) do
    {:ok, quest_reward} =
      attrs
      |> Enum.into(%{
        expire_at: ~U[2025-02-22 23:20:00Z]
      })
      |> Gamification.QuestsRewards.create_quest_reward()

    quest_reward
  end
end
