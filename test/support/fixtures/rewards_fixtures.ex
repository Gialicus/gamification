defmodule Gamification.RewardsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Gamification.Rewards` context.
  """

  @doc """
  Generate a reward.
  """
  def reward_fixture(attrs \\ %{}) do
    {:ok, reward} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name",
        points_cost: 42
      })
      |> Gamification.Rewards.create_reward()

    reward
  end
end
