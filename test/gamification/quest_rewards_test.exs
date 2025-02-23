defmodule Gamification.QuestRewardsTest do
  use Gamification.DataCase

  alias Gamification.QuestRewards

  describe "quest_rewards" do
    alias Gamification.QuestRewards.QuestReward

    import Gamification.QuestRewardsFixtures

    @invalid_attrs %{}

    test "list_quest_rewards/0 returns all quest_rewards" do
      quest_reward = quest_reward_fixture()
      assert QuestRewards.list_quest_rewards() == [quest_reward]
    end

    test "get_quest_reward!/1 returns the quest_reward with given id" do
      quest_reward = quest_reward_fixture()
      assert QuestRewards.get_quest_reward!(quest_reward.id) == quest_reward
    end

    test "create_quest_reward/1 with valid data creates a quest_reward" do
      valid_attrs = %{}

      assert {:ok, %QuestReward{} = quest_reward} = QuestRewards.create_quest_reward(valid_attrs)
    end

    test "create_quest_reward/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = QuestRewards.create_quest_reward(@invalid_attrs)
    end

    test "update_quest_reward/2 with valid data updates the quest_reward" do
      quest_reward = quest_reward_fixture()
      update_attrs = %{}

      assert {:ok, %QuestReward{} = quest_reward} = QuestRewards.update_quest_reward(quest_reward, update_attrs)
    end

    test "update_quest_reward/2 with invalid data returns error changeset" do
      quest_reward = quest_reward_fixture()
      assert {:error, %Ecto.Changeset{}} = QuestRewards.update_quest_reward(quest_reward, @invalid_attrs)
      assert quest_reward == QuestRewards.get_quest_reward!(quest_reward.id)
    end

    test "delete_quest_reward/1 deletes the quest_reward" do
      quest_reward = quest_reward_fixture()
      assert {:ok, %QuestReward{}} = QuestRewards.delete_quest_reward(quest_reward)
      assert_raise Ecto.NoResultsError, fn -> QuestRewards.get_quest_reward!(quest_reward.id) end
    end

    test "change_quest_reward/1 returns a quest_reward changeset" do
      quest_reward = quest_reward_fixture()
      assert %Ecto.Changeset{} = QuestRewards.change_quest_reward(quest_reward)
    end
  end
end
