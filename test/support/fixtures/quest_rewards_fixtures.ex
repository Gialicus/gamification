defmodule Gamification.QuestRewardsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Gamification.QuestRewards` context.
  """

  @doc """
  Generate a quest_reward.
  """
  def quest_reward_fixture(attrs \\ %{}) do
    {:ok, quest_reward} =
      attrs
      |> Enum.into(%{

      })
      |> Gamification.QuestRewards.create_quest_reward()

    quest_reward
  end
end
